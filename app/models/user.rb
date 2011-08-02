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
    if test.nil?
      test = Listeningtest.create()
    end
    if section.nil?
      static_links = ['sd2000/news/001c0n0u.wav','sd2000/news/001c0212.wav','sd2000/news/001c0n0u.wav','sd2000/news/001c0212.wav']
      pool_links = ['news/001c0n0u.wav','news/001c0212.wav','news/001c0n0u.wav','news/001c0212.wav']
      subjects = ['sd2000','sd100','sd1000']
      section = Section.create(:listeningtest_id => test.id, :question_template => 'resources/question.xml', :index => 1, :static_links => static_links, :pool_links => pool_links, :subjects => subjects)
    end
    
    # the listener group is assigned in the Participant model
    part = Participant.create(:user_id => self.id, :section_id => section.id)

  end


end
