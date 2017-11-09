file "sshd_config" do
  path "/etc/ssh/sshd_config"
  action :edit
  block do |content|
    content.gsub!(/^.?Port .+$/, "Port #{node["server"]["ssh"]["port"]}")
    content.gsub!(/^.?PermitRootLogin .+$/, "PermitRootLogin no")
    content.gsub!(/^PasswordAuthentication .+$/, "PasswordAuthentication no")
    content.gsub!(/^UsePAM .+$/, "UsePAM no")
  end
end

service "sshd" do
  subscribes :restart, "file[sshd_config]"
end


