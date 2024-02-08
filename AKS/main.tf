resource "azurerm_kubernetes_cluster" "ckcluster" {
  # azure_policy_enabled                = false
  # custom_ca_trust_certificates_base64 = []
  dns_prefix = "ckcluster-dns"
  # enable_pod_security_policy          = false
  # fqdn                                = "devcluster-dns-bcjgrw8a.hcp.eastus2.azmk8s.io"
  # http_application_routing_enabled    = false
  # id                                  = "/subscriptions/63510f41-a570-4721-9d56-f6375941bd66/resourceGroups/dev-rf/providers/Microsoft.ContainerService/managedClusters/devcluster"
  # kube_admin_config                   = (sensitive value)
  # kube_config                         = (sensitive value)
  # kube_config_raw                     = (sensitive value)
  # kubernetes_version                  = "1.27.7"
  # local_account_disabled              = false
  location = "West Europe"
  name     = "ckcluster"
  # node_resource_group                 = "MC_dev-rf_devcluster_eastus2"
  # node_resource_group_id              = "/subscriptions/63510f41-a570-4721-9d56-f6375941bd66/resourceGroups/MC_dev-rf_devcluster_eastus2"
  # oidc_issuer_enabled                 = false
  # open_service_mesh_enabled           = false
  # portal_fqdn                         = "devcluster-dns-bcjgrw8a.portal.hcp.eastus2.azmk8s.io"        
  # private_cluster_enabled             = false
  # private_cluster_public_fqdn_enabled = false
  # public_network_access_enabled       = true
  resource_group_name = "CKRG"
  # role_based_access_control_enabled   = true
  # run_command_enabled                 = true
  # sku_tier                            = "Free"
  # tags                                = {}
  # workload_identity_enabled           = false

  default_node_pool {
    # custom_ca_trust_enabled      = false
    # enable_auto_scaling          = false
    # enable_host_encryption       = false
    # enable_node_public_ip        = false
    # fips_enabled                 = false
    # kubelet_disk_type            = "OS"
    # max_count                    = 0
    # max_pods                     = 50
    # min_count                    = 0
    name       = "node1"
    node_count = 2
    # node_labels                  = {}
    # node_taints                  = []
    # only_critical_addons_enabled = false
    # orchestrator_version         = "1.27.7"
    # os_disk_size_gb              = 128
    # os_disk_type                 = "Managed"
    # os_sku                       = "Ubuntu"
    # scale_down_mode              = "Delete"
    # tags                         = {}
    # type                         = "VirtualMachineScaleSets"
    # ultra_ssd_enabled            = false
    vm_size = "Standard_B2s"
    # zones                        = [
    #     "1",
    # ]
  }

  identity {
    # identity_ids = []
    # principal_id = "7e0e7187-f2ef-4379-885d-58e67ec23be0"
    # tenant_id    = "12f5e7b9-fdf3-4c52-88d1-970208a67dfc"
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }

  # kubelet_identity {
  #     client_id                 = "37f499b4-4102-4652-b3a1-f51e0faa9b0d"
  #     object_id                 = "57578dfb-b43d-4b87-b0a4-b2b62a61e057"
  #     user_assigned_identity_id = "/subscriptions/63510f41-a570-4721-9d56-f6375941bd66/resourceGroups/MC_dev-rf_devcluster_eastus2/providers/Microsoft.ManagedIdentity/userAssignedIdentities/devcluster-agentpool"
  # }

  # network_profile {
  #     dns_service_ip    = "10.0.0.10"
  #     ip_versions       = [
  #         "IPv4",
  #     ]
  #     load_balancer_sku = "standard"
  #     network_plugin    = "kubenet"
  #     network_policy    = "calico"
  #     outbound_type     = "loadBalancer"
  #     pod_cidr          = "10.244.0.0/16"
  #     pod_cidrs         = [
  #         "10.244.0.0/16",
  #     ]
  #     service_cidr      = "10.0.0.0/16"
  #     service_cidrs     = [
  #         "10.0.0.0/16",
  #     ]

  #     load_balancer_profile {
  #         effective_outbound_ips      = [
  #             "/subscriptions/63510f41-a570-4721-9d56-f6375941bd66/resourceGroups/MC_dev-rf_devcluster_eastus2/providers/Microsoft.Network/publicIPAddresses/e250195d-7921-477b-ae2d-ad26ba596846",
  #         ]
  #         idle_timeout_in_minutes     = 0
  #         managed_outbound_ip_count   = 1
  #         managed_outbound_ipv6_count = 0
  #         outbound_ip_address_ids     = []
  #         outbound_ip_prefix_ids      = []
  #         outbound_ports_allocated    = 0
  #     }
}


output "client_certificate" {
  value     = azurerm_kubernetes_cluster.ckcluster.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.ckcluster.kube_config_raw

  sensitive = true
}
