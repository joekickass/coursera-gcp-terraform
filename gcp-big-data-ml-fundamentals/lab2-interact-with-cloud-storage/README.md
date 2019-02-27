# Lab2 - Interact with cloud storage

Make sure your service account have the following permissions:
- `roles/iam.serviceAccountUser`
- `roles/compute.admin`

```bash
# Set env variables
export GOOGLE_CLOUD_PROJECT=test-account-156913
export GOOGLE_CREDENTIALS=$PWD/test-account-b9a7524644d1.json
export TF_VAR_project=$GOOGLE_CLOUD_PROJECT

# Run
terraform apply

# Tear down
terraform destroy
```