# Specify the base image
FROM python:3.11

# # Update the package manager and install a simple module. The RUN command
# # will execute a command on the container and then save a snapshot of the
# # results. The last of these snapshots will be the final image
# RUN apt-get update -y && apt-get install -y zip graphviz

# Make sure the contents of our repo are in /app
COPY . /app

# Specify working directory
WORKDIR /app

# Install additional Python packages
RUN pip install --upgrade -r requirements.txt

# Install python packages for the lectures
RUN pip install RISE

# Use CMD to specify the starting command
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", \
     "--ip=0.0.0.0", "--allow-root"]
