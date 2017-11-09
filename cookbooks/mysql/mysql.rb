#準備
execute "export MYSQLPW=#{node['mysql']['password']}"
execute 'echo "mysql-server mysql-server/root_password password $MYSQLPW" | sudo debconf-set-selections'
execute 'echo "mysql-server mysql-server/root_password_again password $MYSQLPW" | sudo debconf-set-selections'

# install
package "mysql-server"
package "mysql-client"
package "libmysqlclient-dev"

# set charset
execute "sudo cp /etc/mysql/conf.d/mysql.cnf /etc/mysql/conf.d/mysql.cnf.original"
execute "sudo cp /etc/mysql/mysql.conf.d/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf.original"
execute "sudo sed -i -e '$ a default-character-set=utf8mb4' /etc/mysql/conf.d/mysql.cnf"
execute "sudo sed -i -e '$ a character-set-server=utf8mb4' /etc/mysql/mysql.conf.d/mysqld.cnf"

# restart
service "mysql" do
  action :restart
end
