

# Autogenerated file. DO NOT EDIT.
#
# Copyright (C) 2024 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License. You may obtain a copy of
# the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations under
# the License.
#


variable "on_delete" {
  type        = string
  description = "One of \"drain\" or \"cancel\". Specifies behavior of deletion during terraform destroy."
}

variable "project" {
  type        = string
  description = "The Google Cloud Project ID within which this module provisions resources."
}

variable "region" {
  type        = string
  description = "The region in which the created job should run."
}

variable "inputSubscription" {
  type = string
  description = "Pub/Sub subscription to read the input from, in the format of 'projects/your-project-id/subscriptions/your-subscription-name' (Example: projects/your-project-id/subscriptions/your-subscription-name)"
  default = ""
}

variable "inputTopic" {
  type = string
  description = "Pub/Sub topic to read the input from, in the format of 'projects/your-project-id/topics/your-topic-name'"
  default = ""
}

variable "outputDirectory" {
  type = string
  description = "The path and filename prefix for writing output files. Must end with a slash. DateTime formatting is used to parse directory path for date & time formatters."
}

variable "outputFilenamePrefix" {
  type = string
  description = "The prefix to place on each windowed file. Defaults to: output."
  default = "output"
}

variable "outputFilenameSuffix" {
  type = string
  description = "The suffix to place on each windowed file. Typically a file extension such as .txt or .csv. Defaults to empty."
  default = ""
}

variable "avroTempDirectory" {
  type = string
  description = "Directory for temporary Avro files."
}

variable "outputShardTemplate" {
  type = string
  description = "Defines the unique/dynamic portion of each windowed file. Recommended: use the default (W-P-SS-of-NN). At runtime, 'W' is replaced with the window date range and 'P' is replaced with the pane info. Repeating sequences of the letters 'S' or 'N' are replaced with the shard number and number of shards respectively. The pipeline assumes a single file output and will produce the text of '00-of-01' by default."
  default = "W-P-SS-of-NN"
}

variable "numShards" {
  type = string
  description = "The maximum number of output shards produced when writing. A higher number of shards means higher throughput for writing to Cloud Storage, but potentially higher data aggregation cost across shards when processing output Cloud Storage files. Defaults to: 0."
  default = "0"
}

variable "windowDuration" {
  type = string
  description = "The window duration/size in which data will be written to Cloud Storage. Allowed formats are: Ns (for seconds, example: 5s), Nm (for minutes, example: 12m), Nh (for hours, example: 2h). (Example: 5m). Defaults to: 5m."
  default = "5m"
}

variable "yearPattern" {
  type = string
  description = "Pattern for formatting the year. Must be one or more of 'y' or 'Y'. Case makes no difference in the year. The pattern can be optionally wrapped by characters that aren't either alphanumeric or the directory ('/') character. Defaults to 'YYYY'"
  default = "YYYY"
}

variable "monthPattern" {
  type = string
  description = "Pattern for formatting the month. Must be one or more of the 'M' character. The pattern can be optionally wrapped by characters that aren't alphanumeric or the directory ('/') character. Defaults to 'MM'"
  default = "MM"
}

variable "dayPattern" {
  type = string
  description = "Pattern for formatting the day. Must be one or more of 'd' for day of month or 'D' for day of year. Case makes no difference in the year. The pattern can be optionally wrapped by characters that aren't either alphanumeric or the directory ('/') character. Defaults to 'dd'"
  default = "dd"
}

variable "hourPattern" {
  type = string
  description = "Pattern for formatting the hour. Must be one or more of the 'H' character. The pattern can be optionally wrapped by characters that aren't alphanumeric or the directory ('/') character. Defaults to 'HH'"
  default = "HH"
}

variable "minutePattern" {
  type = string
  description = "Pattern for formatting the minute. Must be one or more of the 'm' character. The pattern can be optionally wrapped by characters that aren't alphanumeric or the directory ('/') character. Defaults to 'mm'"
  default = "mm"
}


provider "google-beta" {
    project = var.project
}

variable "additional_experiments" {
	type = set(string)
	description = "List of experiments that should be used by the job. An example value is  'enable_stackdriver_agent_metrics'."
	default = null
}

variable "autoscaling_algorithm" {
	type = string
	description = "The algorithm to use for autoscaling"
	default = null
}

variable "enable_streaming_engine" {
	type = bool
	description = "Indicates if the job should use the streaming engine feature."
	default = null
}

variable "ip_configuration" {
	type = string
	description = "The configuration for VM IPs. Options are 'WORKER_IP_PUBLIC' or 'WORKER_IP_PRIVATE'."
	default = null
}

variable "kms_key_name" {
	type = string
	description = "The name for the Cloud KMS key for the job. Key format is: projects/PROJECT_ID/locations/LOCATION/keyRings/KEY_RING/cryptoKeys/KEY"
	default = null
}

variable "labels" {
	type = map(string)
	description = "User labels to be specified for the job. Keys and values should follow the restrictions specified in the labeling restrictions page. NOTE: This field is non-authoritative, and will only manage the labels present in your configuration.				Please refer to the field 'effective_labels' for all of the labels present on the resource."
	default = null
}

variable "launcher_machine_type" {
	type = string
	description = "The machine type to use for launching the job. The default is n1-standard-1."
	default = null
}

variable "machine_type" {
	type = string
	description = "The machine type to use for the job."
	default = null
}

variable "max_workers" {
	type = number
	description = "The maximum number of Google Compute Engine instances to be made available to your pipeline during execution, from 1 to 1000."
	default = null
}

variable "name" {
	type = string
}

variable "network" {
	type = string
	description = "The network to which VMs will be assigned. If it is not provided, 'default' will be used."
	default = null
}

variable "num_workers" {
	type = number
	description = "The initial number of Google Compute Engine instances for the job."
	default = null
}

variable "sdk_container_image" {
	type = string
	description = "Docker registry location of container image to use for the 'worker harness. Default is the container for the version of the SDK. Note this field is only valid for portable pipelines."
	default = null
}

variable "service_account_email" {
	type = string
	description = "The Service Account email used to create the job."
	default = null
}

variable "skip_wait_on_job_termination" {
	type = bool
	description = "If true, treat DRAINING and CANCELLING as terminal job states and do not wait for further changes before removing from terraform state and moving on. WARNING: this will lead to job name conflicts if you do not ensure that the job names are different, e.g. by embedding a release ID or by using a random_id."
	default = null
}

variable "staging_location" {
	type = string
	description = "The Cloud Storage path to use for staging files. Must be a valid Cloud Storage URL, beginning with gs://."
	default = null
}

variable "subnetwork" {
	type = string
	description = "The subnetwork to which VMs will be assigned. Should be of the form 'regions/REGION/subnetworks/SUBNETWORK'."
	default = null
}

variable "temp_location" {
	type = string
	description = "The Cloud Storage path to use for temporary files. Must be a valid Cloud Storage URL, beginning with gs://."
	default = null
}

resource "google_dataflow_flex_template_job" "generated" {
    container_spec_gcs_path = "gs://dataflow-templates-${var.region}/latest/flex/Cloud_PubSub_to_Avro_Flex"
    parameters = {
        inputSubscription = var.inputSubscription
        inputTopic = var.inputTopic
        outputDirectory = var.outputDirectory
        outputFilenamePrefix = var.outputFilenamePrefix
        outputFilenameSuffix = var.outputFilenameSuffix
        avroTempDirectory = var.avroTempDirectory
        outputShardTemplate = var.outputShardTemplate
        numShards = var.numShards
        windowDuration = var.windowDuration
        yearPattern = var.yearPattern
        monthPattern = var.monthPattern
        dayPattern = var.dayPattern
        hourPattern = var.hourPattern
        minutePattern = var.minutePattern
    }
    
	additional_experiments = var.additional_experiments
	autoscaling_algorithm = var.autoscaling_algorithm
	enable_streaming_engine = var.enable_streaming_engine
	ip_configuration = var.ip_configuration
	kms_key_name = var.kms_key_name
	labels = var.labels
	launcher_machine_type = var.launcher_machine_type
	machine_type = var.machine_type
	max_workers = var.max_workers
	name = var.name
	network = var.network
	num_workers = var.num_workers
	sdk_container_image = var.sdk_container_image
	service_account_email = var.service_account_email
	skip_wait_on_job_termination = var.skip_wait_on_job_termination
	staging_location = var.staging_location
	subnetwork = var.subnetwork
	temp_location = var.temp_location
}

