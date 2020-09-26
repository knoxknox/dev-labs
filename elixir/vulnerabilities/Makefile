format:
	mix format

console:
	iex -S mix

install:
	mix deps.get

outdated:
	mix hex.outdated

test:
	MIX_ENV=test mix test

cover:
	MIX_ENV=test mix coveralls.html
	find apps -name excoveralls.html | xargs open

release:
	MIX_ENV=prod mix release --overwrite vulnerabilities
