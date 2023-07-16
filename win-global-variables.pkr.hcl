variable project_id {
    type = string
}
variable network_project_id {
    type = string
}
variable image_project_id {
    type = string
}
variable zone {
    type = string
    default = "us-central1-a"
}
variable source_image {
    type = string
    default = "windows-server-2019-dc-v20200813"
}
variable subnetwork {
    type = string
}
variable disk_size {
    type = number
    default = 50
}
variable machine_type {
    type = string
    default = "n1-standard-2"
}
variable winrm_username {
    type = string
    default = "packer_user"
}
variable image_name {
    type = string
    default = "packer--{{timestamp}}"
}
variable instance_name {
    type = string
    default = "packer--{{uuid}}"
}
variable labels {
    type = map(string)
    default = {
        env = "demo"
    }
}
variable tags {
    type = list(string)
}

variable network {
    type = string
}