namespace :currency_report do
  desc 'Fetch results from fixer restful api and export as excel file(xlsx)'
  task export: :environment do

    currencies = ENV.fetch('REPORT_CURRENCIES').split(',')
    formats = ENV.fetch('REPORT_FORMATS').split(',')

    today = Date.today
    yesterday = Date.today - 1
    week_ago = Date.today - 7
    month_ago = Date.today - 30
    year_ago = Date.today - 365

    puts "Currency,Today,Yesterday,#{seven_days_ago},#{month_ago},#{year_ago}"

    currencies.each do |currency|
      response = GetTimeSeriesRateService.call(start_date: year_ago, end_date: today, base: currency, symbols: 'USD')

      json = JSON.parse(response.body)

      # Calculate rate for each time period
      # and output as csv

      # rate_today = 
      # rate_yesterday = 
      # rate_week_ago = 
      # rate_month_ago =
      # rate_year_ago =
    end

    # options = {}

    # options_parser = OptionParser.new do |opts|
    #   opts.banner = "Usage: rake export:excel [options]"
    #   opts.on("-f", "--from", "The from date for the exchange rate", Integer) { |from| options[:from] = from }
    #   opts.on("-t", "--to", "The to date for the exchange rate", Integer) { |to| options[:to] = to }
    #   opts.on("-h", "--help", "Prints this help") do
    #     puts opts
    #     exit
    #   end
    # end

    # args = options_parser.order!(ARGV) {}
    # options_parser.parse!(args)

    # # options_parser.parse!(options)

    # puts options[:from].to_i + options[:to].to_i

    # pp options

    # # puts options[:num1].to_i + options[:num2].to_i
  end
end