locals {
  period         = "${var.it ? 60 * 60 : (60 * 60 * 24)}"
  metrics_period = "${var.it ? 60 : (60 * 10)}"
}

data "template_file" "md" {
  template = "${file("${path.module}/dashboard-widgets.tpl.md")}"

  vars {
    project        = "${var.project}"
    project_key    = "${var.project_key}"
    project_name   = "${var.project_name}"
    subscription   = "${var.subscription}"
    ligoj_url      = "${var.ligoj_url}"
    period         = "${local.period}"
    metrics_period = "${local.metrics_period}"
    region         = "${var.region}"

    asg0      = "${module.instance-B-Spot.autoscaling_group_name}"
    asg1      = "${module.instance-C-ELB.autoscaling_group_name}"
    asg2      = "${module.instance-D-ALB-Spot.autoscaling_group_name}"
    asg0_name = "instance-B-Spot"
    asg1_name = "instance-C-ELB"
    asg2_name = "instance-D-ALB-Spot"
    elb0      = "${module.instance-C-ELB.elb_name}"
    alb0      = "${module.instance-D-ALB-Spot.load_balancer_arn_suffix}"
    alb0_tg   = "${module.instance-D-ALB-Spot.target_group_arn_suffix}"
    elb0_name = "instance-C-ELB"
    alb0_name = "instance-D-ALB-Spot"
    elb0_dns  = "${module.instance-C-ELB.elb_dns}"
    alb0_dns  = "${module.instance-D-ALB-Spot.elb_dns}"
    vpc0      = "${module.vpc.vpc_id}"
  }
}

data "template_file" "widgets" {
  template = "${file("${path.module}/dashboard-widgets.tpl.json")}"

  vars {
    project        = "${var.project}"
    project_key    = "${var.project_key}"
    project_name   = "${var.project_name}"
    subscription   = "${var.subscription}"
    ligoj_url      = "${var.ligoj_url}"
    period         = "${local.period}"
    metrics_period = "${local.metrics_period}"
    region         = "${var.region}"
    md             = "${replace(data.template_file.md.rendered, "\n", "\\n")}"

    asg0      = "${module.instance-B-Spot.autoscaling_group_name}"
    asg1      = "${module.instance-C-ELB.autoscaling_group_name}"
    asg2      = "${module.instance-D-ALB-Spot.autoscaling_group_name}"
    asg0_name = "instance-B-Spot"
    asg1_name = "instance-C-ELB"
    asg2_name = "instance-D-ALB-Spot"
    ec20      = "${module.instance-A.instances}"
    ec20_ip   = "${module.instance-A.public_ip}"
    elb0      = "${module.instance-C-ELB.elb_name}"
    alb0      = "${module.instance-D-ALB-Spot.load_balancer_arn_suffix}"
    alb0_tg   = "${module.instance-D-ALB-Spot.target_group_arn_suffix}"
    elb0_name = "instance-C-ELB"
    alb0_name = "instance-D-ALB-Spot"
    elb0_dns  = "${module.instance-C-ELB.elb_dns}"
    alb0_dns  = "${module.instance-D-ALB-Spot.elb_dns}"
    vpc0      = "${module.vpc.vpc_id}"
  }
}

resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "${var.project_key}_${var.region}"
  dashboard_body = "${data.template_file.widgets.rendered}"
}
