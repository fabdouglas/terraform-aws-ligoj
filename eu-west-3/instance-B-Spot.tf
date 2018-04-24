module "instance-B-Spot" {
  source          = "git::https://github.com/fabdouglas/terraform-aws-abstract-instance"
  name            = "${var.project_key}-instance-B-Spot"
  short_name      = "ligoj-${var.subscription}-instance-B-Spot"
  ami             = "${module.ami_amazon.ami_id}"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.default.id}"]
  key_name        = "${aws_key_pair.auth.id}"
  tags            = "${var.tags}"
  subnets         = ["${module.vpc.public_subnets}"]
  spot_price      = "0.132"
  vpc_id          = "${module.vpc.vpc_id}"
}
