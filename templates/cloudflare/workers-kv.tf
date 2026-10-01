resource "cloudflare_workers_kv_namespace" "babvr_kv_namespace" {
  account_id = var.cloudflare_account_id
  title = "BABVR"
}

resource "cloudflare_workers_kv" "game_server_metrics" {
  account_id = var.cloudflare_account_id
  namespace_id = cloudflare_workers_kv_namespace.babvr_kv_namespace.id
  key_name = "game-server:metrics"
  value = "{}"
}
