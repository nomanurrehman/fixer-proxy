class GetHistoricalRateService < FixerService
  def initialize(date:, base:, symbols:)
    @date = date
    @base = base
    @symbols = symbols
  end

  def call
    cache = cache_service(key: "#{@date}#{@base}#{@symbols}")

    if cache.hit?
      return cache.value
    end
    
    @connection = Faraday.new(url: base_url)
    
    response = @connection.get(@date) do |request|
      request.params['access_key'] = access_key
      request.params['base'] = @base
      request.params['symbols'] = @symbols
    end

    cache.store(value: response)

    response
  end
end