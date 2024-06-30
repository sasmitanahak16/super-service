# Infrastructure Requirement.
1. You have a choice of which hosting provider it is deployed with?
   
Infrastructure will be created on AWS cloud with below resources :
VPC
Subnet (private subnet with AZ)
Security group with restricted inbound
EKS with process scale 
IAM rules for EKS access entry and RBAC rules
ALB or ELB 
Route53 and records
AWS Certificate Manager

2. Your cluster is going to host web services that need to be published on the internet.
   
Write Terraform to provision above resources . 

once the `deployment.yaml, service.yaml, nginx.yaml` is applied on EKS. 
- Then we have a clusterip service which will route trafic to pods. 
- service is again selected by a nginx property file so that nginx will forward the request to service based on path.
- Then at ALB level we need configure backend as kubernetes cluser (to nginx controller service)
- Define ALB listener with ssl offloading , and target as the backend.
- make entry in the Route53 for a record which points to the ALB.

3. A support team will need to be notified if web services lose connectivity to the internal assets.
   
Logs and matics should be confugred on Prometheus, grafana or coludwatch to filter the logs with keyword `network timeout` or `couldn't resolve host` on the web app logs. If it finds the keyword then trigger alert.

5. Developers should be able to deploy code in an automated manner.
   
- Configure CI job in gitlab(any ci tool) to trigger make commands to run unit test, docker build and push application code.
- Configure CD job to run `deploy.sh` file to deploy service to Kubernetes.

5. The cluster will need to be able to access pre-existing internal systems on the "internal-assets" virtual network. Describe how we can access that securely.
- If the internal-assets are in AWS then we can create VPC peering and access the resources.
- If the internal-assets are on datacenters the we have to open vpn gateway or nat gateway in both the network to access the resources with process firewall rules.



