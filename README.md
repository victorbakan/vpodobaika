# Vpodobaika
## _The Simple Flask web server, Ever_

Vpodobaika is a simple 1-2 route web server to get mock data, and is ok for training porposes for docker image build and deploy

## Installation

Vpodobaika requires 
> Flask
> Python >= 3.7.3

Install the dependencies and start the server.

```sh
git clone https://github.com/victorbakan/vpodobaika.git
cd vpodobaika
pip3 install -r code/requirements.txt
python3 code/vpodobaika.py --port 3333 --address 0.0.0.0 --processes 2 --debug=true
```

## Docker

Vpodobaika is very easy to install and deploy in a Docker container.

By default, the Docker will expose port 8030, so change this within the
Dockerfile if necessary. When ready, simply use the Dockerfile to
build the image.

```sh
git clone https://github.com/victorbakan/vpodobaika.git
cd vpodobaika
docker build -f Dockerfile ./ --tag vpodobaika:{YOUR_TAG}
```

This will create the vpodobaika image and pull in the necessary dependencies.
Be sure to swap out {YOUR_TAG} with the actual version of vpodobaika.

Once done, run the Docker image and map the port to whatever you wish on
your host. In this example, we simply map port `3333` the host to
port `8030` of the Docker (or whatever port was exposed in the Dockerfile):
With docker run you can also use any additional option of the vpodobaika application, like:
> `--port 1234`
> `--processes 2`

```sh
docker run -d --restart=always --name vpodobaika -p 3333:8030/tcp vpodobaika:latest --port 8030 --processes 2
```
> Note: You can change ENTRYPOINT to CDM in Dockerfile to have more flaxability how to start/run docker container. ENTRYPOINT is by default

Verify the deployment by navigating to your server address in
your preferred browser.

```sh
127.0.0.1:8030
```

## License

Bakan LTD

**Free Software, Cheers!**
