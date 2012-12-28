#
# Cookbook Name:: backup_scripts
# Recipe:: mysql
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

template "/usr/local/bin/mysql-backup.sh" do
  source "mysql.sh.erb"
  owner "root"
  mode "0700"
end

cron "perform mysql backup" do
  hour node[:backup_scripts][:hour]
  minute node[:backup_scripts][:minute]
  command "/usr/local/bin/mysql-backup.sh >/var/log/mysql-backup.log 2>&1"
end
