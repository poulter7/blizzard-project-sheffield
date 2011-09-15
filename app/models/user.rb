# The User class
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
  validates_uniqueness_of :email



  # passwords are not used so just user a default password
  before_validation(:on => :create) do
      self.password="password"
      self.password_confirmation="password"
  end

  before_create do
      if usergroup?
        self.usergroup = usergroup
      else
        self.usergroup='V'
      end
      self.blocked=0

  end

  # Once the user has been created add them as a paricipant to the default test and assign a listener group
  after_create do

    # if the user is a volunteer then add them to the default listening test
    if self.usergroup == 'V' 
      test = Listeningtest.find(:all)[0]
      if test.nil?
        # Seed the database with defaults
        require Rails.root.join('db','seeds.rb')
        test = Listeningtest.find(:all)[0]
      end
      Participant.create(:user_id => self.id, :listeningtest_id => test.id)
    end

  end


end
