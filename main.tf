data "hcloud_ssh_key" "default" {
  with_selector = "default=true"
}

data "hcloud_primary_ip" "default" {
  with_selector = "default=true"
}

resource "hcloud_server" "server_test" {
  name        = "go-playground"
  image       = "ubuntu-24.04"
  location    = "nbg1"
  server_type = "cax11"
  labels = {
    "test" : "true"
  }

  public_net {
    ipv4_enabled = true
    ipv6_enabled = false
    ipv4= data.hcloud_primary_ip.default.id
  }

  ssh_keys = [data.hcloud_ssh_key.default.id]

  user_data = templatefile("./cloud-init/user_data.tftpl" , {user_name = var.user_name,ssh_public_key = data.hcloud_ssh_key.default.public_key , ssh_port = var.ssh_port})
}