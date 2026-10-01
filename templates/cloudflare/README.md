# Cloudflare Terraform Template

Terraform configuration for Cloudflare Workers KV storage
using the Cloudflare provider.

## Requirements

- **Terraform -** Any recent version
- Existing Cloudflare R2 bucket for storing Terraform state file
- **Environment variables:**

    | Variable                       | Type   | Description                                                              | Required | Default | Example                   |
    |--------------------------------|--------|--------------------------------------------------------------------------|----------|---------|---------------------------|
    | `CLOUDFLARE_API_TOKEN`         | String | API token used by the Cloudflare provider for authentication             | Yes      | None    | `<Cloudflare API Token>`  |
    | `AWS_ACCESS_KEY_ID`            | String | Access key for the S3-compatible remote state backend                    | Yes      | None    | `<S3 Access Key ID>`      |
    | `AWS_SECRET_ACCESS_KEY`        | String | Secret key for the S3-compatible remote state backend                    | Yes      | None    | `<S3 Secret Access Key>`  |
    | `AWS_ENDPOINT_URL_S3`          | String | Endpoint URL of the S3-compatible remote state backend (CLI alternative) | No       | None    | `<S3 Endpoint URL>`       |
    | `TF_VAR_cloudflare_account_id` | String | Value for the `cloudflare_account_id` Terraform variable                 | Yes      | None    | `<Cloudflare Account ID>` |

    <br>

    **Notes:**

    - All required environment variables must be set
      before running the commands below.
    - Never commit environment variable values, `*.tfstate` files,
      or `*.tfvars` files containing secrets.
    - S3 backend credentials must be supplied through
      `AWS_ACCESS_KEY_ID` / `AWS_SECRET_ACCESS_KEY`.
      The `bucket` and `endpoints.s3` backend arguments are not stored
      in `state.tf` and must be supplied via `terraform init -backend-config=...`.
    - Terraform input variables are supplied via `TF_VAR_` environment
      variables (e.g. `TF_VAR_cloudflare_account_id`
      maps to `variable "cloudflare_account_id"`).

## File Structure

```bash
. # Template root
├── providers.tf # Required providers (cloudflare) and provider block
├── state.tf # S3 backend partial configuration (key babvr-cloudflare.terraform.tfstate)
├── variables.tf # Input variables (cloudflare_account_id)
├── workers-kv.tf # KV namespace BABVR plus game-server:metrics key
└── README.md # Template README
```

The configuration creates:

- `cloudflare_workers_kv_namespace.babvr` (`title = "BABVR"`)
- `cloudflare_workers_kv.game_server_metrics`
  (`key_name = "game-server:metrics"`, `value = "{}"`)

## Deploying

Run from this directory (`templates/cloudflare/`).

### Initializing

Backend `bucket` and `endpoints.s3` are supplied at init time.
Credentials come from the environment variables above.

```bash
$ terraform init \
  -backend-config="bucket=<bucket-name>" \
  -backend-config="endpoints={\"s3\": \"https://CLOUDFLARE_ACCOUNT_ID.r2.cloudflarestorage.com\"}"
```

### Planning

```bash
$ terraform plan
```

### Applying

```bash
$ terraform apply
```

### Destroying

```bash
$ terraform destroy
```
