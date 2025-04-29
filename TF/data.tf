data "template_file" "user_scripts_es" {
  template = join("\n",[
      file("${path.module}/scripts/ES-install.sh"),
      file("${path.module}/scripts/elastic-config.sh"),
      file("${path.module}/scripts/filebeat-config.sh")
    ])
}

data "template_file" "user_script_kibana" {
      template = file("${path.module}/scripts/kibana-config.sh")
      vars = {
        PUBLIC_IP = "$(curl http://checkip.amazonaws.com)"
      }
}

data "template_file" "user_scripts_ls" {
  template = join("\n", [
      file("${path.module}/scripts/logstash-install.sh"),
      file("${path.module}/scripts/logstash-config.sh")
  ])
}
