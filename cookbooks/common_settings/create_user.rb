require "unix_crypt"


USERNAME = node['server']['username']
PASSWORD = UnixCrypt::SHA256.build(node['server']['password'], "saltstring")
SSH_KEY = File.read("/Users/akira/Desktop/tmp/for_ccihost/id_rsa.pub")

## これで用意しておく
##
## ssh-keygen -t rsa -b 4096 -f "$(pwd)/secrets/id_rsa"
##
##





user USERNAME do
  password PASSWORD
  shell "/bin/bash"
  create_home true
end

directory "/home/#{USERNAME}/.ssh" do
  owner USERNAME
  mode "700"
end

file "/home/#{USERNAME}/.ssh/authorized_keys" do
  content SSH_KEY
  owner USERNAME
  mode "600"
end
