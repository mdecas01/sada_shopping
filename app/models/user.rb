class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, format: /\A\S+@\S+\z/, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8,
                                 maximum: 15,
                                 allow_blank: true }

  #Checks if the username and password combination is valid
  #BASED ON EXAMPLE FROM PRAGMATIC STUDIO
  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end                               
end
