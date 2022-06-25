FROM python:3.7.3

ADD ./code /app 

WORKDIR /app         

EXPOSE 8030

RUN pip3 install -r requirements.txt





# Choose how to run your docker container - ENTRYPOINT IS BY DEFAULT
#
#   
# !!!!! FOR DEV/STAGE/PROD ENV!!!!!!
#
# Use this to provide a docker image as executable on dev/stage/prod environments
# Example with CMD: you will be able to put only additional flags of the vpodobaika.py application
# For example: docker run -it --name vpodobaika -p 3333:8384/tcp vpodobaika:latest --port 8384 --processes 2
ENTRYPOINT ["python3.7", "vpodobaika.py"]

# 
# !!!!! FOR DEVELOPMENT ONLY!!!!!!
#
# Use this is needed to provide more flaxability for local development
# Example with CMD: you will be able to put anything like /bin/bash
# docker run -it --name vpodobaika -p 3333:3333/tcp vpodobaika:latest /bin/bash
#CMD ["python3.7", "vpodobaika.py"]
