docker-jupyter-oracle
=======================

Docker container image capable of running an jupyter notebook / jupyter lab
server with ability to access an Oracle database.


This project is based on https://github.com/bmamlin/docker-ipython-oracle


The base image is the jupyter/scipy-notebook image.
You may swith to base or another if it fits your need more.



Prerequisties
-------------
You installed [Git](http://git-scm.com/) and [Docker](https://docs.docker.com/installation/).
If you are on OS X or Linux, you may already have git installed (open a terminal and type the
command `git --version`; if it returns a version number, you've already got git).

Step One: Clone this repository
-------------------------------
First, clone a copy of this repository



Step Two: BYOICR = Bring Your Own Instant Client RPMs
-----------------------------------------------------
For this build to work, you will need to supply your own RPMs for Oracle's Instant Client Basic Lite and SDK packages for Linux x86-64.  These are only available once to you once you have registered an Oracle
account and agreed to their license agreement.

1. If you haven't already, [register for an Oracle account](https://login.oracle.com/mysso/signon.jsp).

2. Once logged in to Oracle's website, go to [Instant Client Downloads for Linux x86-64](http://www.oracle.com/technetwork/topics/linuxx86-64soft-092277.html).  You will need to accept their license agreement before you can download anything.

3. Pay close attention to version number and file names.  For this repository, I am using version 11.2.  You want to download two file: Basic Lite and SDK RPMs (file name should end with .rpm).

4. Copy the two Oracle RPM files into the rpms folder.

NOTE: This docker image is built assuming Oracle version 11.2.  If you want to use IPython to
connect to a different version of Oracle, then you'll want to use the corresponding version and
will need to edit the three other places in the Docker file where the versino ("11.2") is
mentioned to match your version.

Step Three: Build your image
----------------------------
Within the folder containing Dockerfile, type this command:

    docker build -t jupyteroracle .


Step Four: Start your docker container
--------------------------------------
Type this command to start a jupyter notebook:

    docker run -d -p 8888:8888 -v <YOUR_LOCAL_FOLDER>:/home/jovyan/work --name jupyteroracle jupyteroracle

Type this command to start a jupyter lab:
  docker run -d -p 8888:8888 -e JUPYTER_ENABLE_LAB=yes -v <YOUR_LOCAL_FOLDER>:/home/jovyan/work --name jupyteroracle jupyteroracle
