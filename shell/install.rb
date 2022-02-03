#!/usr/bin/env ruby

# This install script basically just sources ./all.sh in your ~/.bashrc file.
SOURCE_STATEMENT = "source '#{File.join(__dir__, 'all.sh')}'"
BASHRC_FILE = File.expand_path("~/.bashrc")

unless File.exists?(BASHRC_FILE) && File.read(BASHRC_FILE).include?(SOURCE_STATEMENT)
  File.open(BASHRC_FILE, 'a') do |file|
    file.write "\n" + SOURCE_STATEMENT
  end
end
