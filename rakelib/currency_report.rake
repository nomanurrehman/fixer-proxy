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
  end
end