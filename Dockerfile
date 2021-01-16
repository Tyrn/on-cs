from python:3.8

run mkdir /src/

copy requirements.txt /src/requirements.txt

workdir /src/

run python -m venv .venv

run /src/.venv/bin/pip install -r requirements.txt

cmd /src/.venv/bin/sphinx-build source build -b html
