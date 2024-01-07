From continuumio/miniconda3:4.9.2

# System packages.
RUN apt-get --allow-releaseinfo-change update && apt-get install -y \
  ffmpeg \
  libgl1-mesa-dev \
  libglew2.1 \
  libglfw3-dev \
  wget \
  build-essential \
  swig \
  libgl1-mesa-glx \
  libosmesa6 \
  libosmesa6-dev \
  patchelf \
  git \
  && apt-get clean

ENV MUJOCO_GL=osmesa
ENV PYOPENGL_PLATFORM=osmesa
WORKDIR /root/

# Python packages.
RUN conda install pytorch==1.13.1 torchvision==0.14.1 torchaudio==0.13.1 pytorch-cuda=11.7 -c pytorch -c nvidia
RUN conda install -c conda-forge mesalib
RUN pip install pip --upgrade
COPY requirements.txt /root/
WORKDIR /root
RUN pip install -r requirements.txt --no-cache-dir
RUN pip install dm_control --upgrade --no-cache-dir