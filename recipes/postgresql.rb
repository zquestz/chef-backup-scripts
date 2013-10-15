#
# Cookbook Name:: backup_scripts
# Recipe:: postgresql
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

package "s3cmd" do
  action [:install, :upgrade]
end

node[:backup_scripts][:s3cmd][:users].each do |user|
  home = user.to_s == :root.to_s ? "/root" : "/home/#{user}"

  template "s3cfg" do
      path "#{home}/.s3cfg"
      source "s3cfg.erb"
      user "#{user}"
      group "#{user}"
      mode 0600
  end
end

unless node[:fqdn]
  node.default[:fqdn] = node[:hostname]
end

template "/usr/local/bin/postgresql-backup.sh" do
  source "postgresql.sh.erb"
  owner "root"
  mode "0700"
end

cron "perform postgresql backup" do
  hour node[:backup_scripts][:hour]
  minute node[:backup_scripts][:minute]
  command "/usr/local/bin/postgresql-backup.sh >/var/log/postgresql-backup.log 2>&1"
end
