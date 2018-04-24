public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCvFu4Db/aA+VQlJIM830iK0X+XXhhrYkFsq2tY/FCPoMgY0rxskh/yrEw8tIo3dod3S3H/xPpZlUixVJC5vwoRH8HJMOW3al0fVaveScxGWc7EbnS9v2jdCKPe5zb66bk7FM7TdmkpXKFzNljfJ2YNSY0Bw5Bh7KAjsE/WSccKa1QZwSIb6LVrUzDq8XEsX+ACTRYefF4HbNcob97uPIvf3B6ECbTW14nNQKkuDxcMbfG2QYTg50Ajfmm9AyUiaY3XBk652RGKyY8RyifglgihP8qm6TWibT5Bwd7nGhBHwXFGtfr7Pajra+/wlYQRT5EklU7F0aTFIKUY1FkMCr0BpY6+k8Nj1btwF4xcpqqkHLceApsD3N4vpCzwoLg6ozYti0mT5NJQ+YCgScZiJzCzzifLZFiTrUMFR57/J6iFlLK3ZCcugWl2rdYXb/DeP7GStDHZQO6VPf6rtpSQeBTjKl/pUuyMzthk7AAZnjN0rvAWi8Doef0KKdnDEHzApYuJfHlB1s2d8qysgDw4ORvojVzv6NO1ItGBik9pFoj4tgScgtiJLBMsW1nOzBcAJ6I0VxNBZY3mlj+olZ3enhxlouv9T2cotsw1Nao2mm7410o4noY7dt/uVaWOcowP+7m8s4rFONT+4WXHn7yOGrf1Vya+A2hLDwBKFeB3DnfgqQ== fdaugan"

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
