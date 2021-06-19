# README

## Google Cloud APIs

- Kubernetes Engine API
- Secret Manager API
- Cloud SQL Admin API
- Cloud Resource Manager API

### Enabling the API

```
$ gcloud services enable \
    container.googleapis.com

$ gcloud services enable \
    secretmanager.googleapis.com

$ gcloud services enable \
    sqladmin.googleapis.com

$ gcloud services enable \
    cloudresourcemanager.googleapis.com
```

## Google Cloud Service Accounts

- Terraform

### Creating an Service Account

```
$ GCP_PROJECT=$(gcloud info --format='value(config.project)')
$ TERRAFORM_SA=terraform

$ gcloud iam service-accounts create $TERRAFORM_SA \
    --project=$GCP_PROJECT \
    --display-name $TERRAFORM_SA
```

### Granting an IAM Role

```
$ TERRAFORM_SA_EMAIL=$(gcloud iam service-accounts list \
    --project=$GCP_PROJECT \
    --filter="displayName:$TERRAFORM_SA" \
    --format='value(email)')

$ gcloud projects add-iam-policy-binding $GCP_PROJECT \
    --role roles/owner \
    --member serviceAccount:$TERRAFORM_SA_EMAIL
```

### Creating an Service Account Key

```
$ gcloud iam service-accounts keys create terraform-key.json \
    --iam-account=$TERRAFORM_SA_EMAIL \
    --key-file-type=json
```

### Creating an Service Account Key Secret

```
$ gcloud secrets create terraform-key \
    --data-file=terraform-key.json

$ rm terraform-key.json
```

## Manage Terraform State File

### Creating an Google Cloud Storage Bucket

```
$ GCS_CLASS=multi_regional
$ GCS_BUCKET=python-gke-sample-tfstate

$ gsutil mb -p $GCP_PROJECT -c $GCS_CLASS -l asia gs://$GCS_BUCKET/
```
