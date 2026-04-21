PYTHON ?= python3
VENV ?= .venv
PIP := $(VENV)/bin/pip
PY := $(VENV)/bin/python

.PHONY: venv install freeze clean-venv run-notebook run-lab

venv:
	$(PYTHON) -m venv $(VENV)
	$(PIP) install --upgrade pip

install: venv
	$(PIP) install -r requirements.txt

freeze:
	$(PIP) freeze > requirements.txt

run-notebook: install
	$(PY) -m jupyter lab

run-lab: run-notebook

clean-venv:
	rm -rf $(VENV)
