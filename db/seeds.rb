# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Question.create([{:text =>'whoami?' }, {:text => 'whoareyou?'}])
Resource.create([{:location => 'natural_1.wav'}, {:location => 'natural_2.wav'}, {:location => 'natural_3.wav'}])
