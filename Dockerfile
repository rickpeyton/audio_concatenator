FROM ubuntu
RUN apt-get -y update && apt-get -y install ffmpeg ruby-dev
RUN echo 'alias ll="ls -ltha"' >> ~/.bashrc
RUN mkdir /app
WORKDIR /app
ADD . /app
RUN ruby concat.rb
RUN ffmpeg -f concat -i list.txt -acodec copy book.mp3
