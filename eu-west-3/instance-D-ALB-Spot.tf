module "instance-D-ALB-Spot" {
  source              = "git::https://github.com/fabdouglas/terraform-aws-abstract-instance"
  name                = "${var.project_key}-instance-D-ALB-Spot"
  short_name          = "ligoj-${var.subscription}-instance-D-ALB-Spot"
  ami                 = "${module.ami_amazon.ami_id}"
  instance_type       = "t2.micro"
  security_groups     = ["${aws_security_group.default.id}"]
  security_groups_elb = ["${aws_security_group.default_elb.id}"]
  key_name            = "${aws_key_pair.auth.id}"
  tags                = "${var.tags}"
  subnets             = ["${module.vpc.public_subnets}"]
  max_size            = 2
  spot_price          = "0.132"
  vpc_id              = "${module.vpc.vpc_id}"

  ebs_block_device = [
    {
      device_name           = "/dev/xvdz"
      volume_type           = "gp2"
      volume_size           = "50"
      delete_on_termination = true
    },
  ]

  root_block_device = [
    {
      volume_size           = "50"
      volume_type           = "gp2"
      delete_on_termination = true
    },
  ]
}
