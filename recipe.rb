
include_recipe "./cookbooks/common_settings/apt_update.rb"
include_recipe "./cookbooks/common_settings/timezone_locale.rb"
include_recipe "./cookbooks/common_settings/create_user.rb"
include_recipe "./cookbooks/common_settings/sshd.rb"
include_recipe "./cookbooks/common_settings/tools.rb"



include_recipe "rbenv::system"

include_recipe "./cookbooks/mysql/mysql.rb"
include_recipe "./cookbooks/nginx/nginx.rb"

