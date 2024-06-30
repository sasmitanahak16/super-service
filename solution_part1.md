# Process to unit test, build, deploy service.
Created multistage Dockerfile is created for the service to containerise service with build and publish.
Created `Makefile` which has `unittest, build, push, run`
- `make unittest` command will run the unittest command on test project to execute unit tests.
- `make build` it will docker build the service , which internally do `dotnet restore` , `dotnet build` and `dotnet publish` as part of docker file
- `make run ` will execute docker run command to host application on localhost:8080
- `compose.yaml` can be used to deploy app on local host.
# NOTE: deploy.sh file is created to run kubectl command to deploy and expose service with nginx for k8s cluster deployment.

