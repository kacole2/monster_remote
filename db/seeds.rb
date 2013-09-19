# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'open-uri'

rasberrypi_list = [
  [ "ip_or_fqdn_of_pi", "pi", "mypassword" ],
]

rasberrypi_list do |ipdns, username, password|
  RasberryPi.create( ipdns: ipdns, username: username, password: password )
end


comsetting_list = [
  [ "/dev/ttyACM0", 115200 ],
]

comsetting_list do |comport, baud|
  Comsetting.create( comport: comport, baud: baud )
end


scene_list = [
  [ "Scene 00", true ],
  [ "Scene 01", true ],
  [ "Scene 02", true ],
  [ "Scene 03", true ],
  [ "Scene 05", true ],
  [ "Scene 06", true ],
  [ "Scene 07", true ],
  [ "Scene 08", true ],
  [ "Scene 09", true ],
  [ "Scene 10", true ],
  [ "Scene 11", true ],
  [ "Scene 12", true ],
  [ "Scene 13", true ],
  [ "Scene 14", true ],
]

scene_list do |name, enabled|
  Scene.create( name: name, enabled: enabled )
end
