.PHONY: venv

PY_VERSION=$(shell python -c "import sys; print('%d.%d'% sys.version_info[0:2])")
VALID=$(shell python -c "print($(PY_VERSION) >= 3.6)")

ifeq ($(OS),Windows_NT)
	BIN=venv/Scripts
else
	BIN=venv/bin
endif

ifeq (True,$(VALID))
	PYTHON=python
else
	PYTHON=python3
endif

# setup development environment
venv:
	$(PYTHON) -m venv venv
	$(BIN)/python -m pip install -U pip
	$(BIN)/pip install -U -r requirements.txt
	$(BIN)/pip install -U -r dev-requirements.txt

# re-run if  dependencies change
update:
	$(BIN)/python -m pip install -U pip
	$(BIN)/pip install -U -r requirements.txt
	$(BIN)/pip install -U -r dev-requirements.txt

run:
	$(BIN)/pytest tests/standard -s
