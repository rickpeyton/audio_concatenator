FROM ruby

RUN echo 'alias ll="ls -ltha"' >> ~/.bashrc
RUN mkdir /app
WORKDIR /app

RUN apt-get -y update && apt-get -y install ffmpeg

ADD . /app
RUN ruby concat.rb

CMD ["ffmpeg", "-f", "concat", "-i", "list.txt", "-acodec", "copy", "book.mp3"]
