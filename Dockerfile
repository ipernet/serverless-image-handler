From centos:7

ENV TEMPLATE_OUTPUT_BUCKET='my-bucket-name'
ENV DIST_OUTPUT_BUCKET='my-bucket-name'
ENV VERSION=1

RUN yum install yum-utils epel-release sudo -y && \
    sudo yum-config-manager --enable epel  && \
    sudo yum update -y  && \
    sudo yum install zip wget git libpng-devel libcurl-devel gcc python-devel libjpeg-devel python-pip which -y  && \
    alias sudo='sudo env PATH=$PATH'  && \
    yum groupinstall "Development Tools" -y && \
    pip install --upgrade pip==9.0.3 && \
    sudo pip install setuptools && \
    sudo pip install virtualenv

# docker build -t aws-serverless-thumbnor:latest .
# docker run -v $(pwd):/data aws-serverless-thumbnor:latest bash -c 'cd /data/deployment; sudo ./build-s3-dist.sh $DIST_OUTPUT_BUCKET $VERSION'
