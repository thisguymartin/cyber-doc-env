# Use the Kali Linux rolling distribution latest image
FROM kalilinux/kali-rolling:latest

# Set label with author information
LABEL org.heuristiq.image.authors="Alex Munene (enenumxela)"

# Define arguments and environment variables
ARG HOME=/root
ARG TOOLS=${HOME}/TOOLS
ARG LOCALBIN=${HOME}/.local/bin
ARG WHT=/etc/web-hacking-toolkit

ARG DEBIAN_FRONTEND=noninteractive

ENV WHT=${WHT} \
    HOME=${HOME} \
    TOOLS=${TOOLS} \
    LOCALBIN=${LOCALBIN}

# Update and upgrade the system, and create necessary directories
RUN apt-get update && \
    apt-get upgrade -qq -y && \
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

# Copy compressed files containing scripts and configurations into the image
COPY scripts.7z ${WHT}/scripts.7z
COPY configurations.7z ${WHT}/configurations.7z

# Install p7zip-full, extract scripts, run setup, and move scripts to user bin
RUN apt-get install -y -qq --no-install-recommends p7zip-full && \
    7z x ${WHT}/scripts.7z -o/tmp && \
    for script in $(find /tmp/scripts -maxdepth 1 -type f -name "*-setup*" -print | sort); \
    do \
        echo ${script}; \
        chmod +x ${script}; \
        ${script}; \
    done && \
    chmod +x /tmp/scripts/* && \
    mv -f /tmp/scripts/* ${LOCALBIN}

# Set the working directory
WORKDIR $HOME
