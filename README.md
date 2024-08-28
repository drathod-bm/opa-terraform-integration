# opa-terraform-integration

# EC2 Instance Terraform and Rego Policy

This repository contains Terraform code for creating EC2 instances and a Rego policy to enforce tagging rules. The policy ensures that EC2 instances can only be created if they have a specific tag. If the tag is not present, the GitHub Action will fail.

## Project Overview

- **Terraform Code**: Defines the infrastructure and configuration for deploying EC2 instances.
- **Rego Policy**: Implements policies using Open Policy Agent (OPA) to enforce rules on the Terraform configuration.

## Rego Policy Details

The Rego policy enforces the following rule:
- **Tag Requirement**: EC2 instances must have a tag with the key `project` and value `devex`. Instances that do not meet this criterion will cause the GitHub Action to fail.


## Challenges Faced

I encountered an issue while implementing this. I evaluate the OPA policy to identify EC2 instances with the required tags, and it works locally, However, when evaluating the policy in the GitHub Actions pipeline, the output is empty. I've verified that everything is correct: the local and pipeline configurations are identical, the versions match, all files are present, and permissions are set properly. In debug mode, I noticed that in the pipeline, OPA replaces the input data with a simple "command" string.

## Solution

While further debugging, I identified the issue and found a related discussion on GitHub. The problem is documented in [this issue](https://github.com/open-policy-agent/opa/issues/5619) on the Open Policy Agent repository.