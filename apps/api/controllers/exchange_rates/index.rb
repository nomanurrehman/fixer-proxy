module Api
  module Controllers
    module ExchangeRates
      class Index
        include Api::Action

        def call(params)
          if params[:start_date].nil? or params[:end_date].nil? or params[:base].nil? or params[:symbols].nil?
            self.status = 400
            self.body = {message: 'Please specify start_date, end_date, base, and symbols parameters.'}.to_json
            return
          end

          response = GetTimeSeriesRateService.call(params)

          # TODO: header merge causing problems          
          # self.headers.merge!(response.headers)
          self.status = response.status
          self.body = response.body
        end
      end
    end
  end
end
