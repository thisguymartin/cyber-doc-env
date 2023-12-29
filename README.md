# cyber-doc-env Docker Image

## Overview

`cyber-doc-env` is a Docker image based on the latest Kali Linux rolling distribution, tailored for cyber security testing and experimentation. This image is equipped with various tools and custom scripts, making it ideal for security researchers and enthusiasts.

## Author

- **Martin Patino**
- Contact: [martin.patino@example.com](mailto:martin.patino@example.com)
- GitHub: [thisguymartin](https://github.com/thisguymartin)

## Features

- Built on `kalilinux/kali-rolling:latest`
- Includes essential tools like Git and Golang
- Customizable environment with support for additional packages and scripts

## Installation

To use this Docker image, ensure you have Docker installed on your system. Then, pull the image from Docker Hub (or build it from the Dockerfile provided):

```bash
docker pull yourdockerhubusername/cyber-doc-env
```

Alternatively, to build the image locally:

```bash
git clone https://github.com/yourgithubusername/cyber-doc-env.git
cd cyber-doc-env
docker build -t cyber-doc-env .
```

## Usage

Run the Docker container with the following command:

```bash
docker run -it cyber-doc-env
```

This will open a bash shell in the Kali Linux environment, where you can access the pre-installed tools and scripts.

### Running Tools

For example, to run `dalfox` (a powerful web vulnerability scanner), use the following command inside the Docker container:

```bash
dalfox url http://testphp.vulnweb.com
```

This command will execute `dalfox` against a test website to demonstrate its functionality.


### Running Scripts
You can also just run script called pull_image_start.sh to pull the image and start the container.

```bash
chdmod +x pull_image_start.sh
./pull_image_start.sh
```
