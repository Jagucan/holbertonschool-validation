FROM jenkins/jenkins:lts
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
ENV JAVA_HOME="/usr/local/openjdk-11"
RUN wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/latest/download/hadolint-Linux-x86_64 \
&& chmod a+x /bin/hadolint \
&& hadolint Dockerfile
COPY cst.yml /cst.yml
CMD ["container-structure-test", "test", "--image", "your-docker-image-name", "--config", "/cst.yml"]
