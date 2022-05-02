# Start from python:3.8-alpine base image
FROM python:3.8.10-slim

# The latest alpine images don't have some tools like (`git` and `bash`).
# Adding git, bash and openssh to the image
RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6 -y

# Make dir app
RUN mkdir /app
WORKDIR /app
COPY requirements.txt requirements.txt

RUN pip install --upgrade pip
RUN pip install -r requirements.txt
COPY app.py app.py
COPY templates templates

# Run the executable
CMD ["python", "app.py"]