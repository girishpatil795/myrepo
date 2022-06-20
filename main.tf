# Specify the GCP Provider
provider "google" {
project = var.project_id
region  = var.region
}

# # Create a GCS Bucket
# resource "google_storage_bucket" "my_bucket" {
# for_each      = toset(var.bucket_name)
# name     = each.value
# location = var.region
# }

# #Create Data fusion
# resource "google_data_fusion_instance" "basic_instance" {
#   name = "my-datafusion"
#   region = var.region
#   type = "BASIC"
# }

# #Create app engine
# resource "google_app_engine_application" "app" {
#   project     = var.project_id
#   location_id = "us-central"
#   database_type = "CLOUD_DATASTORE_COMPATIBILITY"
# }

# # Create a GCS Bucket for cloud functions
# resource "google_storage_bucket" "function_bucket" {
# name     = var.fuction_bucket
# location = var.region
# }

# #Create cloud functions
# resource "google_storage_bucket_object" "archive" {
#   name   = "index.zip"
#   bucket = google_storage_bucket.function_bucket.name
#   source = "function.zip"
# #   content_type = "application/zip"
# }

# resource "google_cloudfunctions_function" "function" {
#   name        = "function-test"
#   description = "My function"
#   runtime     = "nodejs10"

#   available_memory_mb   = 128
#   source_archive_bucket = google_storage_bucket.function_bucket.name
#   source_archive_object = google_storage_bucket_object.archive.name
#   trigger_http          = true
#   timeout = 60
#   entry_point           = "helloWorld"
# }

# # IAM entry for all users to invoke the function
# resource "google_cloudfunctions_function_iam_member" "invoker" {
#   project        = var.project_id
#   region         = var.region
#   cloud_function = google_cloudfunctions_function.function.name

#   role   = "roles/cloudfunctions.invoker"
#   member = "allUsers"
# }

# resource "google_firestore_document" "mydoc" {
#   project     = var.project_id
#   collection  = "somenewcollection"
#   document_id = "my-doc-testing"
#   fields      = "{\"something\":{\"mapValue\":{\"fields\":{\"akey\":{\"stringValue\":\"avalue\"}}}}}"
# }

# resource "google_compute_network" "vpc_network" {
# name = "shravan-network"
# }
# resource "google_compute_subnetwork" "public-subnetwork" {
# name = "shravan-subnetwork"
# ip_cidr_range = "10.2.0.0/16"
# region = var.region
# network = google_compute_network.vpc_network.name
# }

# resource "google_compute_network" "vpc_network-2" {
# name = "shravan-network-2"
# }
# resource "google_compute_subnetwork" "public-subnetwork-2" {
# name = "shravan-subnetwork-2"
# ip_cidr_range = "192.168.0.0/16"
# region = var.region
# network = google_compute_network.vpc_network-2.name
# }

# resource "google_bigquery_dataset" "default" {
#   dataset_id                  = "foo"
#   friendly_name               = "shravan-test"
#   description                 = "This is a test description"
#   location                    = "US"
#   default_table_expiration_ms = 3600000

#   labels = {
#     env = "default"
#   }
# }

# resource "google_bigquery_table" "default" {
#   dataset_id = google_bigquery_dataset.default.dataset_id
#   table_id   = "bar"

#   time_partitioning {
#     type = "DAY"
#   }

#   labels = {
#     env = "default"
#   }

#   schema = <<EOF
# [
#   {
#     "name": "permalink",
#     "type": "STRING",
#     "mode": "NULLABLE",
#     "description": "The Permalink"
#   },
#   {
#     "name": "state",
#     "type": "STRING",
#     "mode": "NULLABLE",
#     "description": "State where the head office is located"
#   }
# ]
# EOF

# }