
variable "storagebox_ssh_private_key" {
    sensitive = true
    default = "~/.ssh/storagebox"
}

variable "storagebox_ssh_public_key" {
    sensitive = true
    default = "~/.ssh/storagebox.pub"
}
