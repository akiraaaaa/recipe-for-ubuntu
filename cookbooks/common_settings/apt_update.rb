execute "apt-get update" do
  command "sudo apt-get update"
end

execute "apt-get upgrade" do
  command "sudo apt-get -y upgrade"
end
