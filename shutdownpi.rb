require 'net/ssh'

Net::SSH.start('monsterpi.kendrickcoleman.c0m', 'pi', :password => "u1805003") do |ssh|
  ssh.exec "sudo shutdown -h now"
end