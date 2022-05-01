# Welcome to Gary Sin's mysandbox

This repo contains demo terraform script to automate the process of creating an AWS EC2 instance and do some stuffs with a startup script.

This has been tested on my linux box.

Step 1.
```
$ git clone https://github.com/gsin0080/mysandbox.git .
```

Step 2.
```
cd terraform
export AWS_ACCESS_KEY_ID=<Your_AWS_Access_Key>
export AWS_SECRET_ACCESS_KEY=<Your_AWS_Secret_Access_Key>
export AWS_DEFAULT_REGION=<Your_AWS_Region>
```

Step 3.
```
$ terraform init
$ terraform plan
```

Step 4.
```
terraform apply --auto-approve
```

Step 5.
```

```


Step 6.
In order to terminate the AWS components
```
cd mysandbox\terraform
terraform destroy
```
