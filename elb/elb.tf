resource "aws_elb" "practice_elb" {
  name = "practice-elb1"
  security_groups = var.security_group
  subnets = [var.subnet, var.subnet2]
  cross_zone_load_balancing   = true
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    interval = 30
    target = "HTTP:80/"
  }
  listener {
    lb_port = 80
    lb_protocol = "http"
    instance_port = "8080"
    instance_protocol = "http"
  }
  instances= [i-0c12cf8552ad42a64]
}
