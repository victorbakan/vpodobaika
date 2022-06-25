# Vpodobaika
## _The Simple Flask web server, Ever_

![Build Status](https://github.com/victorbakan/vpodobaika/actions/workflows/vpodobaika-main.yaml/badge.svg)

Vpodobaika is a simple 1-2 route web server to get mock data, and is ok for training purposes for docker image build and deploy
It has only 2 HTTP routes that work in web browser: 
> / # have on the page hyper link that leads to /companies

> /companies # retuns some mock json value


## Installation and Start (without docker)

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

We have regular automatic builds for this application and you can find up to date and ready to use docker image 
> [Our docker repository](https://hub.docker.com/repository/docker/bakan/vpodobaika) 

or build it by yourself - it's very easy

By default, the Docker will expose port 8030, so change this within the
Dockerfile if necessary. When ready, simply use the Dockerfile to
build the image.

```sh
git clone https://github.com/victorbakan/vpodobaika.git
cd vpodobaika
docker build -f Dockerfile ./ --tag vpodobaika:${YOUR_TAG}
```

This will create the vpodobaika image and pull in the necessary dependencies.
Be sure to swap out ${YOUR_TAG} with the actual version of vpodobaika.

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
http://127.0.0.1:8030/
```
#### Dgoss - simple test for development
In this repository there is `goss.yaml` file for dgoss console tool to test if application executable file is available inside docker and if indeed python service is running. Start docker container and run the following command to check if everything is ok inside container or integrate this one to your daily CI. 

> Install dgoss on your local machine
```curl -fsSL https://goss.rocks/install | sh```

```sh
cd vpodobaika
dgoss run ${your-vpodobaika-container-name}
```

## Helm 

There is Helm chart in helm directory. This is ready for use helm chart for kubernetes with all defaults to launch Vpodobaika application

> Further processing means that you already have kubertnete cluster, installed helm tool 

Example (change all neccesary versions):
```sh
helm install vpodobaika -f values.yaml --set image.tag=1.0.9 vpodobaika-1.0.0.tgz
# or install just from repo folder
cd vpodobaika
helm install vpodobaika helm/vpodobaika/ -f values.yaml --set image.tag=1.0.9
# then check deployment and release
helm list
```
Than you shoud access this service locally for example by http://127.0.0.1:4444/ doing port-forwarding
```sh
$ kubectl get svc
NAME         TYPE        CLUSTER-IP    EXTERNAL-IP   PORT(S)   AGE
kubernetes   ClusterIP   10.100.0.1    <none>        443/TCP   31h
vpodobaika   ClusterIP   10.100.49.2   <none>        80/TCP    17m

$ kubectl port-forward service/vpodobaika 4444:80
Forwarding from 127.0.0.1:4444 -> 8030
Forwarding from [::1]:4444 -> 8030
```




## License

Bakan LTD

**Free Software, Cheers!**
