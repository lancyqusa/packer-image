packer {
  required_plugins {
    googlecompute = {
      version = ">= 1.1.1"
      source  = "github.com/hashicorp/googlecompute"
    }
  }
}

source "googlecompute" "windows-template" {
  project_id = var.project_id
  # image_project_id = var.image_project_id
  source_image = var.source_image
  # use_internal_ip = true
  # use_iap = true
  image_name = var.image_name
  instance_name = var.instance_name
  network = "example-vpc"
  access_config = null
  omit_external_ip = true
  network_project_id = var.network_project_id
  subnetwork = var.subnetwork
  zone = var.zone
  disk_size = var.disk_size
  machine_type = var.machine_type
  communicator = "winrm"
  winrm_username = var.winrm_username
  winrm_insecure = true
  winrm_use_ssl = true
  labels = var.labels
  tags = var.tags
  metadata =  {
    windows-startup-script-cmd = "winrm quickconfig -quiet & net user /add ${var.winrm_username} & net localgroup administrators  ${var.winrm_username} /add & winrm set winrm/config/service/auth @{Basic=\"true\"}"
  }
}

build {
  sources = ["sources.googlecompute.windows-template"]
  provisioner "windows-shell" {
    inline = ["dir c:\\ > c:\\dirlist.txt"]
  }
  provisioner "powershell" {
    scripts = ["provisioners/windows/win-install-iis.ps1"]
  }
}
