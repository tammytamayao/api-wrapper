class CurrencyApi::Client

BASE_URL = 'https://api.apilayer.com/fixer/'.freeze
API_KEY = 'B0NTcvsEYF007mjK747Kz99mM6vy3LCZ'

    def symbols
        request(
            endpoint: "symbols",
            params: {}
        )
    end

    def latest(options)
        request(
            endpoint: "latest",
            params: {symbol: options['symbol'], base: 'USD'}
        )
    end

    def convert(options)
        request(
            endpoint: "convert",
            params: {from: 'USD', to: 'PHP', amount: 1000}
        )
    end

    def fluctuation(options)
        request(
            endpoint: "fluctuation",
            params: {symbol: options['symbol'], base: 'USD', start_date: Date.today-7.days, end_date: Date.today }
        )
    end

private

    def request(method: "get", endpoint:, params: {})
        params = params.merge(apikey: API_KEY)
        response = connection.send(method, endpoint, params)
        return JSON.parse(response.body) if response.status==200
    end

    def connection
        @connection ||= Faraday.new(url: BASE_URL, params: {})
    end
end