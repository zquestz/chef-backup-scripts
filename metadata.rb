maintainer       "Trond Arve Nordheim"
maintainer_email "t@binarymarbles.com"
license          "Apache 2.0"
description      "Installs and configures the backup scripts."
long_description IO.read(File.join(File.dirname(__FILE__), "README.md"))
version          "1.0.0"

%w(ubuntu debian).each do |platform|
  supports platform
end

recipe           "backup_scripts:postgresql", "Installs and configures the PostgreSQL backup scripts."

attribute "backup_scripts",
  :display_name => "Backup Scripts",
  :description => "Hash of Backup Scripts attributes.",
  :type => "hash"

attribute "backup_scripts/target_directory",
  :display_name => "Target directory",
  :description => "The directory where backups should be placed",
  :default => "/backups"

attribute "backup_scripts/hour",
  :display_name => "Hour",
  :description => "The hour of day (24hr) to run the backup scripts",
  :default => "3"

attribute "backup_scripts/minute",
  :display_name => "Minute",
  :description => "The minute of the hour to run the backup scripts",
  :default => "0"

attribute "backup_scripts/retention_days",
  :display_name => "Retention days",
  :description => "The number of days to store backed up files before deleting them",
  :default => "10"
