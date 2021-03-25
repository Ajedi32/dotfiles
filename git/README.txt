scripts/include-config.sh $config_file # Install a config file
scripts/uninclude-config.sh $config_file # Uninstall a config file

scripts/include-config.sh configs/*.gitconfig # Install all config files
scripts/uninclude-config.sh configs/*.gitconfig # Uninstall all config files

scripts/alias-script.sh scripts/* # Create git aliases for all scripts in the scripts folder
scripts/unalias-script.sh scripts/* # Remove git aliases for all scripts in the scripts folder

git config --global alias.$alias_name "!$full_path_to_script" # Create an alias with a custom name for a script
git config --global --unset alias.$alias_name # Remove an alias with a custom name
