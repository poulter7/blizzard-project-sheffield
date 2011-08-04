class User < ActiveRecord::Base
  # Types of user and their user code
  USER_GROUPS = Hash[ 'Specialist'    ,'S',
                      'Volunteer'     ,'V',
                      'Undergraduate' ,'U',
                      'Amazon'        ,'A']


  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :email

  before_validation(:on => :create) do
      self.password="password"
      self.password_confirmation="password"
      # FIXME this will set all users as volunteers
      self.usergroup='V'
  end

  # Once the user has been created add them as a paricipant to the default test and assign a listener group
  after_create do


    test = Listeningtest.find(:all)[0]
    section = Listeningtest.find(:all)[0]
    if test.nil? && section.nil?
      # Seed the database with defaults
      require Rails.root.join('db','seeds.rb')
      test = Listeningtest.find(:all)[0]
      section = Listeningtest.find(:all)[0]
    end

    Participant.create(:user_id => self.id, :section_id => section.id)
  end


end
