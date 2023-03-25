# Capstone Project (Cloud DevOps TeamMiRA - Modern Infrastructure Robotic Automation)

Capstone project for  CMU - TalentSprint Dev-Ops for Executives : Automate the infrastructure with  CI/CD pipeline 
for the Pythn Based  applications for improved Deployment and Infra changes.

## inFra Structure as a Code using Terraform - Provisioning Infrastrucre : MIRA

The CI CD pipeline is as follows for this project. For initial set up:

- Set up jenkins
- Install dependencies for local development
- Create AWS infrastructure

For application development:

- Make development change
- Commit to git
- Update AWS stack using `./delpoyMira.sh` commands listed below if required
- Push to repository
- Jenkins build automatically runs based on triggers
  - Files are linted
  - Docker image build and uploaded to ECR
  - ECS tasks updated to run new Docker image using rolling deployment

## Configuration Management using Ansible : MIRA

The CI CD pipeline is as follows for this project. For initial set up:

- Set up jenkins
- Install dependencies for local development
- Create AWS infrastructure

For application development:

- Make development change
- Commit to git
- Update  commands listed below if required
- Push to repository
- Jenkins build automatically runs based on triggers
  - Files are linted
  - Docker image build and uploaded to ECR
  - ECS tasks updated to run new Docker image using rolling deployment
  
## CI CD Pipeline using Jenkins : MIRA

The CI CD pipeline is as follows for this project. For initial set up:

- Set up jenkins
- Install dependencies for local development
- Create AWS infrastructure

For application development:

- Make development change
- Commit to git
- Update AWS stack using `./awsCoUp.sh` commands listed below if required
- Push to repository
- Jenkins build automatically runs based on triggers
  - Files are linted
  - Docker image build and uploaded to ECR
  - ECS tasks updated to run new Docker image using rolling deployment

## Running the stuff

There is a `Makefile` that contains lots of useful commands.
Running `make` will list them, like the below output.

```text
help:           Show this help.
setup:          Create the virtial environment to run this project
env:            List the environment versions
lint:           Check the validity of the project files
test:           Run the tests for this prject
install:        Install the required imports for this project
docker-build:   Build the docker image and list available docker images
docker-upload:  Upload the docker image to AWS
start-api:      Run the python application locally
```

## Creating the infrastructure

From the base of this repository run the following to create or update the deployment.

```bash
aws configure # set to credentials with appropriate access
cd scripts; ./awsCoUp.sh network ../cloudformation/01-network.yml ../cloudformation/01-network-parameters.json; cd ..
# Wait for the network stack to be complete
cd scripts; ./awsCoUp.sh cluster ../cloudformation/02-cluster.yml ../cloudformation/02-cluster-parameters.json; cd ..
```

## Jenkins set up

Full jenkins set up details can be found in `jenkinsSetup.md`.

## Sonarcube and Nexus set up

Full jenkins set up details can be found in `jenkinsSetup.md`.

## Output

From running the above the following will be created.

The application is currently running [here](http://key-school.com/) is a link to the load balancer.

AWS Stacks:

![Terraform Results](./img/01-tfStacks.png)
![AWS  network stack creation Through CI Pipeline outputs](./img/02-networkOutputs.png)
![WS  Instance stack creation Through CI Pipeline  info](./img/03-clusterStackInfo.png)
![AWS  Software/using  Ansible Through CI Pipeline outputs](./img/04-clusterOutputs.png)

Jenkins build when the lint fails:
![Jenkins lint failing](./img/05-jenkinsBuildFail.png)

Jenkins build when the lint passes and deployed :
![Jenkins lint passing and deploying to AWS](./img/06-jenkinsBuildPass.png)

Docker Image of Sonar , Nexus with new image uploaded:
![docker image uploaded](./img/07-dockerImageUploaded.png)

Hello world application running:
![Application running in AWS](./img/08-applicationRunning.png)

<h3>Author</h3>
<a href = "https://github.com/justb1swa/izac2/Capstone-Project-Devops">GitHub</a>
