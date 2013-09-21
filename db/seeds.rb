# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'open-uri'



RasberryPi.create( ipdns: "ip_or_dns_of_pi", username: "pi", password: "mysecretpw" )

Comsetting.create( comport: "/dev/ttyACM0", baud: 115200 )

Scene.create( name: "Scene 00", enabled: true )
Scene.create( name: "Scene 01", enabled: true )
Scene.create( name: "Scene 02", enabled: true )
Scene.create( name: "Scene 03", enabled: true )
Scene.create( name: "Scene 04", enabled: true )
Scene.create( name: "Scene 05", enabled: true )
Scene.create( name: "Scene 06", enabled: true )
Scene.create( name: "Scene 07", enabled: true )
Scene.create( name: "Scene 08", enabled: true )
Scene.create( name: "Scene 09", enabled: true )
Scene.create( name: "Scene 10", enabled: true )
Scene.create( name: "Scene 11", enabled: true )
Scene.create( name: "Scene 12", enabled: true )
Scene.create( name: "Scene 13", enabled: true )
Scene.create( name: "Scene 14", enabled: true )

