# small docker imafe for DL content from yt
# for audio use it with: docker run --rm -v .:/tmp/workdir -w /tmp/workdir ytdl:latest -x --audio-format mp3 -o "file.mp3" "url"
FROM python:3.12-slim

RUN apt update -y && apt upgrade -y
RUN apt install -y git
RUN apt install -y make
RUN apt install -y zip
RUN apt install -y python-is-python3
RUN apt install -y pandoc
RUN apt install -y ffmpeg

WORKDIR /tmp
RUN git clone https://github.com/ytdl-org/youtube-dl
WORKDIR /tmp/youtube-dl   

RUN make
RUN cp youtube-dl /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/youtube-dl"]