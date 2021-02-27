PY_DIRS=graphite-probe-linux.py
VE ?= ./ve
SYS_PYTHON ?= python3
PY_SENTINAL ?= $(VE)/sentinal
PIP_VERSION ?= 21.0.1
MAX_COMPLEXITY ?= 10
PY_DIRS ?= $(APP)

FLAKE8 ?= $(VE)/bin/flake8
PIP ?= $(VE)/bin/pip

all: flake8

clean:
	rm -rf $(VE)
	find . -name '*.pyc' -exec rm {} \;

$(PY_SENTINAL):
	rm -rf $(VE)
	$(SYS_PYTHON) -m venv $(VE)
	$(PIP) install pip==$(PIP_VERSION)
	$(PIP) install --upgrade setuptools
	$(PIP) install flake8
	touch $@

flake8: $(PY_SENTINAL)
	$(FLAKE8) $(PY_DIRS) --max-complexity=$(MAX_COMPLEXITY)

.PHONY: flake8 clean
