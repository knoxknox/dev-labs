install:
	@uv sync

update:
	@uv lock --upgrade

outdated:
	@uv tree --outdated --depth 1

console:
	@uv run bpython

lint:
	@uv run ruff check

format:
	@uv run ruff format

run:
	@uv run python src/main.py

test:
	@uv run pytest --no-header -rN

coverage:
	@uv run pytest --cov=src --no-header -rN
