format:
	mix format

console:
	iex -S mix

compile:
	mix compile

deps:
	mix deps.get

outdated:
	mix hex.outdated

test:
	MIX_ENV=test mix test

cover:
	MIX_ENV=test mix coveralls.html
	find apps -name excoveralls.html | xargs open
