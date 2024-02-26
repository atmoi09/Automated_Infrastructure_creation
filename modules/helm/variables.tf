
variable "depends_on_var" {
  description = "A list of resources this resource depends on"
  type        = list(any)
  default     = []
}
variable "publicip" {
  description = "Public IP address of the AKS"
  type        = string  
}