# Add your files

Add the mp3 files you want to concatenate to the root of the directory.

For the process to work the files must end up in order when sorted
alphabetically.


# Build it
docker build -t audio .


# Run it
docker run -it --rm --name concatenator audio /bin/bash


# Copy out your file
docker cp concatenator:/app/book.mp3 .
