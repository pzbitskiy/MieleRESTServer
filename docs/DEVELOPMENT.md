# Development

## Install development tooling

```bash
python3 -m venv .venv
.venv/bin/pip install --upgrade pip
.venv/bin/pip install -e ".[dev]"
```

## Run formatter (Black)

`black` uses configuration from `pyproject.toml` (`[tool.black]`).

```bash
.venv/bin/python -m black .
```

## Run linter (Pylint)

`pylint` uses configuration from `pyproject.toml` (`[tool.pylint.*]`).

```bash
.venv/bin/python -m pylint $(git ls-files '*.py')
```
