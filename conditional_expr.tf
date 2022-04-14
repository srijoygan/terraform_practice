
variable "istest"{
}

locals {
 common_tags = {
   owner = "Devops team"
   service = "backend"
 }
}
resource "aws_instance" "dev"{
  ami = "ami-087c17d1fe0178315"
  instance_type = "t2.micro"
  tags = local.common_tags
  count = var.istest == true ? 1:0
}

resource "aws_instance" "prod"{
  ami = "ami-087c17d1fe0178315"
  instance_type = "t2.large"
  count = var.istest == false ? 1:0
  tags = local.common_tags
}
