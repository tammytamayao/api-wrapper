class CurrenciesController < ApplicationController
    before_action :set_params

    def symbols
        client = CurrencyApi::Client.new
        @symbols = client.symbols
    end

    def latest
        client = CurrencyApi::Client.new
        @rates = client.latest(@options)
    end

    def convert
        client = CurrencyApi::Client.new
        @exchange = client.convert(@options)
    end

    def fluctuation
        client = CurrencyApi::Client.new
        @exchange = client.fluctuation(@options)
    end

private

    def set_params
        @options = params.permit(:base, :symbol, :date, :amount, :from, :to, :end_date, :start_date).to_h
    end
end
