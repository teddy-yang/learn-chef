
execute 'create-kibana-sourcelist' do
  action :run
    command "echo 'deb http://packages.elastic.co/kibana/4.4/debian stable main' | sudo tee -a /etc/apt/sources.list.d/kibana-4.4.x.list"
  end

execute 'apt-get-update' do
  action :run
    command "apt-get update"
end

execute 'install-kibana' do
  action :run
    command "apt-get -y install kibana"
end


template "/opt/kibana/config/kibana.yml" do
  source 'kibana-yml.erb'
  #variables(
  #file: "#{node['db2']['db2_install_dir']}",
  #install_type: "#{node['db2']['install_type']}",
  #db2password: "#{node['db2']['db2_password']}"
  #)
  owner 'root'
  group 'root'
  mode '0644'
end

execute 'start-on-bootup' do
  action :run
    command "update-rc.d kibana defaults 96 9"
end

service 'kibana' do
  action :start
end
