FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-runtime

RUN apt-get update && \
    apt-get install -y git

# Upgrade pip and install Python dependencies
COPY requirements.txt requirements.txt
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Install ESIM
RUN git clone https://github.com/coetaur0/ESIM.git && \
    cd ESIM && \
    pip install .

# Create a user named pymarluser with the given UID
ARG UID=1000
RUN groupadd -r dockergroup && \
    useradd -r -u $UID -g dockergroup --create-home dockeruser

# Finalise
USER dockeruser
RUN mkdir /home/dockeruser/ESIM
WORKDIR /home/dockeruser/ESIM
