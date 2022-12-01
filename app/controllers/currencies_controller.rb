class CurrenciesController < ApplicationController
    before_action :initialize_client
    before_action :set_params

    def symbols
        @symbols = @client.symbols
    end

    def latest
        @rates = @client.latest(@options)
    end

    def convert
        @exchange = @client.convert(@options)
    end

    def fluctuation
        @exchange = @client.fluctuation(@options)
    end

private
    def initialize_client
        @client = CurrencyApi::Client.new
    end

    def set_params
        @options = params.permit(:base, :symbol, :date, :amount, :from, :to, :end_date, :start_date).to_h
    end
end
