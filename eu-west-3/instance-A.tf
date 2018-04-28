module "instance-A" {
  source          = "git::https://github.com/fabdouglas/terraform-aws-abstract-instance"
  name            = "${var.project_key}-instance-A"
  short_name      = "ligoj-${var.subscription}-instance-A"
  ami             = "${module.ami_amazon.ami_id}"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.default.id}"]
  key_name        = "${aws_key_pair.auth.id}"
  tags            = "${var.tags}"
  subnets         = ["${module.vpc.public_subnets}"]
  vpc_id          = "${module.vpc.vpc_id}"
}

resource "aws_volume_attachment" "instance-A-storage-1" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.instance-A-storage-1.id}"
  instance_id = "${module.instance-A.instance}"
}

resource "aws_ebs_volume" "instance-A-storage-1" {
  availability_zone = "${element(local.azs, 0)}"
  size              = 10
}
