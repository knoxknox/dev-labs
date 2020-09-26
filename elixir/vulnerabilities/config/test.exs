import Config

config :logger, level: :info
config :crawler, http_client: Crawler.Http.ClientMock
