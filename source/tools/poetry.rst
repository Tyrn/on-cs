Poetry
======

A heavyweight package manager for Python.

Reference
---------

- `Index <https://python-poetry.org/docs/>`__
- `CLI <https://python-poetry.org/docs/cli/>`__
- `Configuration <https://python-poetry.org/docs/configuration/>`__
- `Project structure <https://python-poetry.org/docs/pyproject/>`__
- `Packaging/Publishing <https://python-poetry.org/docs/libraries/>`__

Discussion
----------

`WORKON_HOME (#214) <https://github.com/python-poetry/poetry/issues/214>`__

Addons
------

- `Poetry - plugin for IntelliJ IDEs
  <https://plugins.jetbrains.com/plugin/14307-poetry>`__

Basic Usage
-----------

First time::

    $ git clone <my-project>
    $ cd my-project
    $ poetry install

Session::

    $ poetry shell
    ...
    $ exit

or just::

    $ source .venv/bin/activate
    ...
    $ deactivate

depending on how you manage your virtual environments.

Poetry commands usually run just fine regardless of the
virtual environment being explicitly on/off, unless you rely on
WORKON_HOME. If such is the case, you have to manually
enter your virtual environment first.

Poetry uses either local `.venv`, or its own cache
of virtual environments (`~/.cache/pypoetry/virtualenvs`),
depending on `poetry.toml` entry::

    [virtualenvs]
    create = true
    in-project = true

It's always easy to check::

    $ poetry env info

Add/remove packages::

    $ poetry add [-D] package
    $ poetry remove [-D] package

Run `pytest` (or anything) without explicitly entering the virtual
environment::

    $ poetry run pytest
