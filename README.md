Jenkins with Docker and Ansible

Run a jenkins, such as get up an jenkins container, create a new project with freestyle project named as jenkins-docker
Git address: git@github.com:sangrealest/Jenkins_Docker_Ansible.git
Workspace: /var/lib/jenkins/jobs/jenkins-docker/workspace
Poll SCM: H * * * *





Shell Command:

/bin/bash

set -e

set -u

echo '>>> Get old container id'

CID=$(docker ps | grep "jenkins-docker" | awk '{print $1}')

echo $CID

sudo /usr/bin/docker build -t jenkins-docker /var/lib/jenkins/jobs/jenkins-docker/workspace | tee /var/lib/jenkins/jobs/jenkins-docker/workspace/Docker_build_result.log


echo '>>> Stopping old container'

if [ "$CID" != "" ];then
sudo  /usr/bin/docker stop $CID
fi

echo '>>> Restarting docker'
sudo service docker restart
sleep 5
  
echo '>>> Starting new container'
sudo /usr/bin/docker run -p 3000:80 -d jenkins-docker


Add jenkins to docker group: sudo usermod -G docker jenkins
Grant jenkins use sudo without password: jenkins ALL=(ALL:ALL) NOPASSWD: ALL

after this, build the project.

Please DO NOT use 2048 Game as business use, just for personal exercise.
