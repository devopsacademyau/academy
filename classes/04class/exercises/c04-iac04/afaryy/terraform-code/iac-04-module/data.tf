data "template_file" "shell-script" {
  template = file("${path.module}/scripts/install_apache.sh")

  vars = {
    stack_name = "${var.stack_name}"
  }
}