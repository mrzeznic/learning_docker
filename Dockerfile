# Use an existing docker image as a base
FROM ubuntu:18.04
LABEL maintainer="mrzeznic"
LABEL version="v0.1"

ENV PYTHON_VERSION="2.7.15"

# Download and install a dependency
ENV HOME  /home/ce
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

ADD https://oss.sonatype.org/content/groups/public/org/bom4v/ti/sql-to-csv-spark_2.11/0.0.5-spark2.3-hive3hdp/sql-to-csv-spark_2.11-0.0.5-spark2.3-hive3hdp.jar /cost_estimator_data_pipeline/

RUN \
    apt-get update && \
    apt-get install -y git make build-essential python-dev python-pip libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl && \ 
    git clone git://github.com/pyenv/pyenv.git ~/.pyenv && \
    pyenv install ${PYTHON_VERSION} && \
    pyenv versions && \
    #git clone https://github.com/pyenv/pyenv.git ~/.pyenv && \
    #echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile && \
    #echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile && \
    #apt-get install -y python${PYTHON_VERSION} python-pip && \
    #pyenv install 3.6 && \
    #pyenv versions && \
    rm -rf /var/lib/apt/lists/*



#Tell the image what to do when it starts as a container
CMD ["python", "--version"]