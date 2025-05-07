resource "aws_instance" "tf-es" {
  depends_on      = [aws_key_pair.HWC-3]
  ami             = "ami-0c9978668f8d55984"
  instance_type   = "t3.medium"
  key_name        = "HWC-3"
  user_data       = join("\n", [ 
    data.template_file.user_scripts_es.rendered,
    data.template_file.user_es_config.rendered,
    data.template_file.user_script_kibana.rendered ])
  security_groups = [aws_security_group.TF_security_group.name]

  tags = {
    Name = "Elastic-Kibana"
  }
}

resource "aws_instance" "tf-ls" {
  depends_on      = [aws_key_pair.HWC-3]
  ami             = "ami-0c9978668f8d55984"
  instance_type   = "t3.medium"
  key_name        = "HWC-3"
  user_data       = join("\n", [ 
    data.template_file.user_scripts_ls.rendered,
    data.template_file.user_ls_config.rendered,
    data.template_file.user_fb_config.rendered ])
  security_groups = [aws_security_group.TF_security_group.name]

  tags = {
    Name = "Logstash-Filebeat"
  }
}

resource "aws_key_pair" "HWC-3" {
  key_name   = "HWC-3"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "HWC_key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "HWC.pem"
}


