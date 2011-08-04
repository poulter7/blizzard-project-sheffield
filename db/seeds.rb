# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# setup the default Listening test and its constituant sections
test = Listeningtest.create()
static_links = ['sd2000/news/001c0n0u.wav','sd2000/news/001c0212.wav','sd2000/news/001c0n0u.wav','sd2000/news/001c0212.wav']
pool_links = ['news/001c0n0u.wav','news/001c0212.wav','news/001c0n0u.wav','news/001c0212.wav']
subjects = ['sd2000','sd100','sd1000']
Section.create(:listeningtest_id => test.id, :question_template => 'resources/question_templates/q.json', :index => 1, :static_links => static_links, :pool_links => pool_links, :subjects => subjects)
