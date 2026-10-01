# IaC Templates Index

Reusable Terraform templates for Build-A-Bearville Rewritten.

## Available Templates

| Template                           | Provider   | Description                                                     |
|------------------------------------|------------|-----------------------------------------------------------------|
| [`cloudflare/`](cloudflare/readme) | Cloudflare | Workers KV namespace `BABVR` plus the `game-server:metrics` key |

## Adding a New Template

1. Create `templates/<provider>/` with `providers.tf`, `state.tf`,
   `variables.tf`, one or more `<resource>.tf` files, and a `README.md`.
2. Document every environment variable (including `TF_VAR_` inputs)
   in a table, following the Game Server README style.
3. Document `terraform init` (with `-backend-config`), `plan`, `apply`,
   and `destroy` steps.
4. Register the template in the table above.
