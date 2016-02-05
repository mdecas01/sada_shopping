class Category < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  validates :level, presence: true

  has_many :categorizations, dependent: :destroy
  has_many :products, through: :categorizations

  LEVEL = [1, 2, 3]


  def to_s
    self.name
  end	
 
end
