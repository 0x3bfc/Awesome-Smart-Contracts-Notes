FROM ubuntu:18.04

LABEL name=Manticore
LABEL src="https://github.com/trailofbits/manticore"
LABEL creator="Trail of Bits"
LABEL dockerfile_maintenance=aabdulwahed

ENV LANG C.UTF-8

RUN apt-get -y update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y install z3 python3 python3-setuptools python3-pip git wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install capstone unicorn

# Install solc 0.5.3
RUN wget https://github.com/ethereum/solidity/releases/download/v0.5.3/solc-static-linux \
    && chmod +x solc-static-linux \
    && mv solc-static-linux /usr/bin/solc

# Install Manticore from dev-truffle-artifacts branch
RUN git clone https://github.com/trailofbits/manticore.git /opt/
WORKDIR /opt/
RUN git checkout dev-truffle-artifacts
RUN python3 setup.py install

WORKDIR /

CMD ["/bin/bash"]
