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
      self.usergroup='V'
  end

  # Once the user has been created add a default task
  after_create do
      @sectionDefault = Section.create(:name => "Default Test", :user_id => self.id)
      Task.create(
        :section_id => @sectionDefault.id,
        :index => 0,
        :question_id => 1,
        :subject_id=> 3,
        :elements => [1,1,2]
      )
      Task.create(
        :section_id => @sectionDefault.id,
        :index => 1,
        :question_id => 2,
        :subject_id=> 3,
        :elements => [1]
      )
      Task.create(
        :section_id => @sectionDefault.id,
        :index => 2,
        :question_id => 2,
        :subject_id=> 1,
        :elements => [2,1]
      )

  end


end
