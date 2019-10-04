# apache-docker

A template for a Docker image to run Apache with PHP and fpm (for FastCGI)

## Getting Started

1. Clone or download the repository. 
2. cd to the folder.
3. ./build-me.sh
3. ./start-me.sh

### Prerequisites

* You MUST put the template in a folder whose name matches your image name.
    * My scripts assume the folder name matches the image name.
    * I have an unpublished 'start-all.sh' script in the parent folder, where all my containers live and it assumes the folder name matches the image name.
* You must have Docker.

### Series and Conventions

I (intend to) create(d) a library of Docker templates.  They all have the same general form and reflect my personal standard for Docker images. 

* I try to put EVERYTHING related to the container under this folder -- programs, data, configuration, etc.
* I prefer host-mode networking, for efficiency, but I sometimes use a Mac, where you have to use bridge mode. I try to make my Dockerfile and my docker-compose.yml support both flavors.
* I'm biased in favor of Ubuntu and Apache because I'm familiar with them.  Maybe someday I'll add Alpine-based images and nginx and friends but my time is more valuable than a few MB of disk or CPU cycles.

STANDARDS:

* Create a Dockerfile and docker-compose.yml so I can use docker-compose.
* Always put ports in the docker-compose.yml even if using host network mode. It documents what I'm doing and it makes it work if I move it to Macbook where I must use bridged mode.
* Put EXPOSE in the Dockerfile even if using host network mode. It documents what I'm doing and it makes it work if I move it to Macbook where I must use bridged mode.
* Put both of these in the docker-compose.yml, to ease movement between Linux and Mac.  (Comment-out one.)
    * `network_mode: bridge  # MUST un-comment this line on Mac. MAY un-comment on Linux.`
    * `#network_mode: host    # MAY use host networking on Linux for better performance.`

* Note: On a Macbook, using Docker Desktop 2.1.0.2 or newer, you can talk to container ports via 'localhost' if you  do all of these:
    * put EXPOSE in the Dockerfile
    * put the port map in dockerfile.yml (e.g. ports:"80:80")
    * use network_mode: bridge

#### Scrpts

* **build-me.sh** - script for building the image
* **start-me.sh** - script to launch a container
* **run-me.sh**   - just like start-me.sh, except it does not detatch (i.e. It runs in the foreground, not the background.)
* **stop-me.sh**  - script to kill a running container
* **bash-me.sh**  - script to open a bash shell in the container
* **restart-me.sh** - stops and starts the container
* **truncate-me.sh** - truncates the Docker log for the container

#### Subfolders

* **bin**  - mounts as /container/bin in the container.  Scripts to be run in the container.  Typically has container-rc.sh, which is launched at container start-up.
* **conf** - configuration files which are either copied to the container or mounted in the container.
* **data** - data for the running image.
* **log**  - log files from within the container get written here. This is more convenient than having to open a shell within the container to read the logs.

## Authors

* **Kevin Kleinfelter** - * - [kleinfelter](https://github.com/kleinfelter)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

