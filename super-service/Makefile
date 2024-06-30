
.PHONY: unittest
unittest: 
        nunit-console ./test/SuperService.UnitTests.csproj
        
.PHONY: build
build:
    docker build -t superservice .

.PHONY: push
push: build
        #push to artifactory

.PHONY: run
run: build
        docker run -d -p 8080:80 --name superserviceapp superservice