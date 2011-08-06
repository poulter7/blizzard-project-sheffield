# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# setup the default Listening test and its constituant sections
test = Listeningtest.create()
pool_links = ['news/001c0n0u.wav','news/001c0212.wav','news/001c0n0u.wav','news/001c0212.wav']
subjects = ['sd2000','sd100','sd1000']
subjects2 = ['sd2000','sd100','sd1000', 'siS2000', 'natural']
Section.create(:listeningtest_id => test.id, :question_template => 'resources/question_templates/similarity.json', :pool_links => pool_links, :subjects => subjects)
Section.create(:listeningtest_id => test.id, :question_template => 'resources/question_templates/similarity.json', :pool_links => pool_links, :subjects => subjects2)
Section.create(:listeningtest_id => test.id, :question_template => 'resources/question_templates/natural.json', :pool_links => pool_links, :subjects => subjects2)
Section.create(:listeningtest_id => test.id, :question_template => 'resources/question_templates/street.json', :pool_links => pool_links, :subjects => subjects2)
Section.create(:listeningtest_id => test.id, :question_template => 'resources/question_templates/repeat.json', :pool_links => pool_links, :subjects => subjects2)

