#
# Cookbook Name:: backup_scripts
# Attribute File:: default
#
# Copyright 2012, Binary Marbles Trond Arve Nordheim
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default[:backup_scripts][:target_directory] = "/backups"
default[:backup_scripts][:hour] = "3"
default[:backup_scripts][:minute] = "0"
default[:backup_scripts][:retention_days] = 10
default[:backup_scripts][:s3_bucket] = "rakuten-backups"
default[:backup_scripts][:aws_access_key_id] = ""
default[:backup_scripts][:aws_secret_access_key] = ""
default[:backup_scripts][:s3cmd][:users] = [:root, :ubuntu]