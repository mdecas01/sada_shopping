class User < ActiveRecord::Base
  has_secure_password
  has_many :orders, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :reviews
  has_many :wishlists, dependent: :destroy
  has_many :wished_products, through: :wishlists, source: :product

  validates :name, presence: true
  validates :email, presence: true, format: /\A\S+@\S+\z/, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8,
                                 maximum: 15,
                                 allow_blank: true }

  #Checks if the username and password combination is valid
  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end  

  def self.search(search)
   if search
     self.where("name like ?", "%#{search}%")
   else
     self.all
   end
 end                             
end
