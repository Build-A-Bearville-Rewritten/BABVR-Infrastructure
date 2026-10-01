variable "cloudflare_account_id" {
  description = "ID of the Cloudflare account that owns the Workers KV namespace."
  type = string
  sensitive = true
}
