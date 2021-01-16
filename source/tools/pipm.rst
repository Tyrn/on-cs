Pipm
====

`pipm` is a lightweight wrapper for `pip`.
It extends `pip` functionality by keeping top-level dependencies in
`setup.cfg` and managing `requirements` files.

Reference
---------

- `Project repository
  <https://github.com/jnoortheen/pipm>`__

Basic Usage
-----------

::

    $ source .venv/bin/activate
    $ pip install pipm

Update `setup.cfg`::

    $ pipm install pipm

Install a dependency::

    $ pipm install sphinx

Install a development dependency::

    $ pipm install sphinx-reload --dev

Install development dependencies from `dev-requirements.txt`::

    $ pipm install --dev

Install all dependencies from `*requirements*.txt`::

    $ pipm install --all

In a project maintained with `pipm` the relevant part of
`setup.cfg` is going to look like this::

    [options]
    install_requires = 
        pipm~=20.2.4
        sphinx~=3.3.1

    [options.extras_require]
    dev = 
        sphinx-reload~=0.2.0
