Black
=====

An opinionated Python source code formatter.

Reference
---------

- `Index <https://black.readthedocs.io/en/stable/>`__

Basic Usage
-----------

Add to `pyproject.toml` an entry like this,

::

    [tool.black]
    line-length = 88
    target-version = ['py38']
    include = '\.pyi?$'
    exclude = '''

    (
      /(
          \.eggs         # exclude a few common directories in the
        | \.git          # root of the project
        | \.hg
        | \.mypy_cache
        | \.tox
        | \.venv
        | _build
        | buck-out
        | build
        | dist
      )/
    )
    '''

so you can run

::

    $ black .
