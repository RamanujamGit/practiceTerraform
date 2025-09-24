namespaces = [
  {
    name                = "ns1"
    sku                 = "Standard"
    capacity            = 1
    eventhubs = [
      { name = "hub1", partition_count = 2, message_retention = 1 },
      { name = "hub2", partition_count = 4, message_retention = 3 }
    ]
  },
  {
    name                = "ns2"
    sku                 = "Standard"
    capacity            = 2
    eventhubs = [
      { name = "hub3", partition_count = 2, message_retention = 2 }
    ]
  }
]