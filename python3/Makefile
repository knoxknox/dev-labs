install:
	@poetry install

outdated:
	@poetry show --latest

console:
	@poetry run bpython

lint:
	@poetry run ruff check

format:
	@poetry run ruff format

run:
	@poetry run python src/main.py

test:
	@poetry run pytest --no-header -rN
