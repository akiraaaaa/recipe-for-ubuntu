package "language-pack-ja-base"
package "language-pack-ja"


execute "set-timezone" do
  command "sudo timedatectl set-timezone Asia/Tokyo"
end


execute "update-locale" do
  command "sudo update-locale LANG=ja_JP.UTF-8"
end
