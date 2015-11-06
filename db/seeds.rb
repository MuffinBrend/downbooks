# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
    { username: 'foobar', name: 'Foo Bar', email: 'foobar@downbooks.com'},
    { username: 'johndoe', name: 'John Doe', email: 'johndoe@downbooks.com'},
])
