# Use the Kali Linux rolling distribution latest image
FROM kalilinux/kali-rolling:latest

# Set label with author information
LABEL maintainer="Martin Patino"
LABEL org.heuristiq.image.authors="Martin Patino (thisguymartin)"

# Define arguments and environment variables
ARG HOME=/root
ARG TOOLS=${HOME}/TOOLS
ARG LOCALBIN=${HOME}/.local/bin
ARG WHT=/etc/cyber-doc-env

ARG DEBIAN_FRONTEND=noninteractive

ENV WHT=${WHT} \
    HOME=${HOME} \
    TOOLS=${TOOLS} \
    LOCALBIN=${LOCALBIN}

# Update and upgrade the system, and create necessary directories
RUN apt-get update && \
    apt-get upgrade -qq -y && \
    apt-get install -y git golang && \
    if [ ! -d ${WHT} ]; \
    then \
        mkdir -p ${WHT}; \
    fi && \
    if [ ! -d ${TOOLS} ]; \
    then \
        mkdir -p ${TOOLS}; \
    fi && \
    if [ ! -d ${LOCALBIN} ]; \
    then \
        mkdir -p ${LOCALBIN}; \
    fi

# Copy files to the container and set permissions 
COPY packages_install ${WHT}/packages_install
COPY initial_setup ${WHT}/initial_setup

# Copy scripts to the container and set permissions
RUN chmod +x ${WHT}/packages_install
RUN chmod +x ${WHT}/initial_setup


RUN ./${WHT}/packages_install
RUN ./${WHT}/initial_setup

# Set the working directory
WORKDIR $HOME

# Optional: Set a default command, e.g., starting a shell
CMD ["/bin/bash"] 
