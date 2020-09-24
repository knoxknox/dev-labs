defmodule Crawler.Http.Base do
  @type url() :: String.t()
  @callback get(url) :: {:ok, any()} | {:error, any()}
end
