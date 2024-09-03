FROM ubuntu:jammy

RUN curl https://repository.moosefs.com/moosefs.key | gpg -o /etc/apt/keyrings/moosefs.gpg --dearmor
RUN echo "deb [arch=arm64 signed-by=/etc/apt/keyrings/moosefs.gpg] http://repository.moosefs.com/moosefs-3/apt/ubuntu/jammy jammy main" > /etc/apt/sources.list.d/moosefs.list
RUN apt update -y
RUN apt upgrade -y
RUN apt install -y curl gpg
RUN apt install moosefs-chunkserver
ENTRYPOINT mfschunkserver start -f
