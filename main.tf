provider "ibm" {
#  ibmcloud_api_key    = var.ibmcloud_api_key
}

resource "ibm_container_cluster" "cluster" {
  name         = "${var.cluster_name}${random_id.name.hex}"
  datacenter   = var.datacenter
  org_guid     = data.ibm_org.org.id
  space_guid   = data.ibm_space.space.id
  account_guid = data.ibm_account.account.id
  no_subnet    = true
  subnet_id    = [var.subnet_id]
  kube_version = "1.8.6"

  workers {
    name    = "worker1"
    version = "1.8.6"
  }
  workers {
    name    = "worker2"
    version = "1.8.6"
  }
  workers {
    name    = "worker3"
    version = "1.8.6"
  }

  machine_type    = var.machine_type
  isolation       = var.isolation
  public_vlan_id  = var.public_vlan_id
  private_vlan_id = var.private_vlan_id
}

