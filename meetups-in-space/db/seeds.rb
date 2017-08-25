# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')

Meetup.destroy_all;
Meetup.create(name: 'Adaptimmune', description: "Biotech meetup", location: "The Navy Yard",  creator: 'Erin')
Meetup.create(name: 'Dungeons and Dragons Meetup', description: "Come play D&D", location: "Conshohocken",  creator: 'Andrew')
Meetup.create(name: 'Pokemon meetup', description: "Come catch em all!", location: "Ritenhouse Square",  creator: 'Sebastian')
