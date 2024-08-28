package terraform

default allow = false

allow {
    some i
    resource := input.planned_values.root_module.resources[i]
    resource.type == "aws_instance"  # Check if it's an AWS resource
    resource.values.tags["project"] == "devex"
}

