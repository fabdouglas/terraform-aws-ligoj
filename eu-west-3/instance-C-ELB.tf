module "instance-C-ELB" {
  source              = "git::https://github.com/fabdouglas/terraform-aws-abstract-instance"
  name                = "${var.project_key}-instance-C-ELB"
  short_name          = "ligoj-${var.subscription}-instance-C-ELB"
  ami                 = "${module.ami_amazon.ami_id}"
  instance_type       = "t2.micro"
  security_groups     = ["${aws_security_group.default.id}"]
  security_groups_elb = ["${aws_security_group.default_elb.id}"]
  key_name            = "${aws_key_pair.auth.id}"
  tags                = "${var.tags}"
  subnets             = ["${module.vpc.public_subnets}"]
  max_size            = 5
  vpc_id              = "${module.vpc.vpc_id}"
  accept_alb          = false
}
