class GetTimeSeriesRateService < FixerService

  def initialize(start_date:, end_date:, base:, symbols:)
    @start_date = start_date
    @end_date = end_date
    @base = base
    @symbols = symbols
  end

  def call
    cache = cache_service(key: "#{@start_date}#{@end_date}#{@base}#{@symbols}")

    if cache.hit?
      return cache.value
    end

    @connection = Faraday.new(url: base_url)

    response = @connection.get('timeseries') do |request|
      request.params['access_key'] = access_key
      request.params['start_date'] = @start_date
      request.params['end_date'] = @end_date
      request.params['base'] = @base
      request.params['symbols'] = @symbols
    end

    cache.store(value: response)

    response
  end
end