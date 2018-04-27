public_key = "ssh-rsa ..."

project = "7890"

project_key = "client-project"

project_name = "Client - Project"

subscription = "1234"

ligoj_url = "http://localhost/ligoj"

it = true

tags = {}

ingress = {
  "Public" = "0.0.0.0/0 22-22 tcp" # "0.0.0.0/0,::/0 22-22 tcp"
  "HTTP"   = "0.0.0.0/0 80-80 tcp"
}

ingress-elb = {
  "Public" = "0.0.0.0/0 80-80 tcp"
}

cidr = "10.0.0.0/16"

azs = ["a", "b"]

private_subnets = ["10.0.1.0/24", "10.0.2.0/24"] #, "10.0.2.0/24", "10.0.3.0/24"]

public_subnets = ["10.0.101.0/24", "10.0.102.0/24"] #, "10.0.102.0/24", "10.0.103.0/24"]
