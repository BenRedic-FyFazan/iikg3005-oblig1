locals {
    owner = "khh"
    service_name = "tst"
    location = "West Europe"
    name_prefix = "khh-we"

    common_tags = {
        service = local.service_name
        owner = local.owner
        location = local.location
    }
}