Mypy
====

Optional static typing for Python.

Reference
---------

- `Index <https://mypy.readthedocs.io/en/latest/index.html>`__
- `Configuration <https://mypy.readthedocs.io/en/latest/config_file.html#config-file>`__

Addons
------

- `Pydantic plugin <https://pydantic-docs.helpmanual.io/mypy_plugin/>`__

Basic Usage
-----------

Configure `setup.cfg`::

    [mypy]
    plugins = pydantic.mypy
    ignore_missing_imports = True

Run::

    $ mypy src/

Limitations
-----------

A pydantic-related entry like this ::

    vader_id: constr(max_length=100)

triggers an error::

    src/schemas.py:17: error: Invalid type comment or annotation
    src/schemas.py:17: note: Suggestion: use constr[...] instead of constr(...)

Discussion
----------

`#156 <https://github.com/samuelcolvin/pydantic/issues/156>`__
`#239 <https://github.com/samuelcolvin/pydantic/issues/239>`__
