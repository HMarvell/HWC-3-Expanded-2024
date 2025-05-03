data "template_file" "user_scripts_es" {
  template = file("${path.module}/scripts/ES-install.sh")
}

data "template_file" "user_es_config" {
      template = file("${path.module}/scripts/elastic-config.sh")
        vars = {
          PRIVATE_IP = "$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)"
      }
}      

data "template_file" "user_fb_config" {
      template = file("${path.module}/scripts/filebeat-config.sh")
        vars = {
          PRIVATE_IP_LS = aws_instance.tf-ls.private_ip
      }
}  
data "template_file" "user_script_kibana" {
      template = file("${path.module}/scripts/kibana-config.sh")
      vars = {
        PRIVATE_IP = "$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)"
      }
}

data "template_file" "user_scripts_ls" {
  template = file("${path.module}/scripts/logstash-install.sh")
}

data "template_file" "user_ls_config" {
      template = file("${path.module}/scripts/logstash-config.sh")
      vars = {
        PRIVATE_IP_ES = aws_instance.tf-es.private_ip
      }
}
