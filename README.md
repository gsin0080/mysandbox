# Welcome to Gary Sin's mysandbox

This repo contains demo terraform script to automate the process of creating an AWS EC2 instance and do some stuffs with a startup script.

This has been tested on my linux box.

## Step 1
Clone the code to your machine 
```
git clone https://github.com/gsin0080/mysandbox.git 
```


## Step 2
Export the AWS credentials and default region (feel setup the aws profile for your user account)
```
export AWS_ACCESS_KEY_ID=<Your_AWS_Access_Key>
export AWS_SECRET_ACCESS_KEY=<Your_AWS_Secret_Access_Key>
export AWS_DEFAULT_REGION=<Your_AWS_Region>
```

## Step 3
Initialize the work directory
```
cd mysandbox/terraform
terraform init
```

## Step 4
Create a plan
```
terraform plan
```

## Step 5
Time to build the AWS stack
```
terraform apply --auto-approve
```

Example of the output
```
Apply complete! Resources: 9 added, 0 changed, 0 destroyed.

Outputs:

instance_public_ip_addr = [
  "13.211.106.161",
]
```

## Step 6
To access the Homepage 
```
http://<instance_public_ip_addr>
```
To access the search function
```
http://<instance_public_ip_addr>/log/<your_search_string>

Example:
http://13.211.106.161/log/hi
{"results":[{"key":1,"value":"hihihihihih\n"},{"key":2,"value":"hihihi\n"},{"key":3,"value":"hi\n"}]}
```
It will return an JSON objects with all the matched results

Format of the resource.log 
```
<timestamp>    <result_of_the_docker_stats_command>
```

## Finally
In order to terminate the AWS components
```
terraform destroy
```
