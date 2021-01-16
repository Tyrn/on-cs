Git Hooks
=========

Handling Git events (on the client side).

Reference
---------

- `Index <https://git-scm.com/docs/githooks>`__
- `Introduction <https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks>`__

Basic Usage
-----------

Pre-commit hook, Black for Python example
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Create `.pre-commit-config.yaml`::

    repos:
      - repo: https://github.com/ambv/black
        rev: stable
        hooks:
        - id: black

Install and run::

    $ pipm install pre-commit --dev
    $ pre-commit install
    $ pre-commit run --all-files
