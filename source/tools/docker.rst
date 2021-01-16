Docker
======

OS-level virtualization platform.

Reference
---------

- `Index <https://docs.docker.com/reference/>`__
- `Cheatsheet (printable) <https://dmitryfrank.com/projects/docker-quick-ref>`__
- `Another cheatsheet <https://medium.com/statuscode/dockercheatsheet-9730ce03630d>`__
- `Docker and Kubernetes book collection
  <https://github.com/anzhihe/Free-Docker-Books>`__
- `Python image <https://hub.docker.com/_/python>`__
- `Alpine lightweight image <https://hub.docker.com/_/alpine>`__

Tips and Tricks
---------------

Glossary
--------

Container
^^^^^^^^^

A Docker image, when it’s run in a host computer, spawns a process with
its own namespace, known as a Docker container. A Docker container has a
thin read/write layer known as the container layer.
Any changes to the filesystem of a
container, such as writing new files or modifying existing files, are done to
this writable container layer rather than the lower layers.

Image
^^^^^

Docker image is a read-only template that forms the foundation of your
application.
Docker images are created using a series of commands, known as
instructions, in the `Dockerfile`.

Layer
^^^^^

A layer is a modification applied to a Docker image as represented by an
instruction in a Dockerfile. Typically, a layer is created when a base image
is changed.
