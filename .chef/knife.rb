current_dir = File.dirname(__FILE__)
log_level                 :info
log_location              STDOUT
node_name                 "chefadmin"
client_key                "~/learn-chef/.chef/chefadmin.pem"
chef_server_url           "https://chefserver/organizations/4thcoffee"
cookbook_path             ["~/learn-chef/cookbooks"]

knife[:editor]         = "vim"
knife[:secret_file]    = "#{current_dir}/encrypted_data_bag_secret"
knife[:supermarket_site] = 'https://supermarket.chef.io/'