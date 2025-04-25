
variable "storagebox_ssh_private_key" {
    sensitive = true
    default = "~/.ssh/storagebox"
}

variable "storagebox_ssh_public_key" {
    sensitive = true
    default = "~/.ssh/storagebox.pub"
}

variable "storagebox_username" {
    sensitive = true
}

variable "storagebox_hostname" {
    sensitive = true
}
