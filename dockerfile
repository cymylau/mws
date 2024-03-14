FROM busybox:latest
maintainer="https://github.com/cymylau/mws"
# Create a non-root user to own the files and run our server
RUN adduser -D static
USER static
WORKDIR /home/static
# Copy the static website
# Use the .dockerignore file to control what ends up inside the image!
COPY ./www .
# Run BusyBox httpd
CMD ["busybox", "httpd", "-f","-p", "8888"]
