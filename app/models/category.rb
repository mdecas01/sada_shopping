class Category < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  validates :level, presence: true

  has_many :categorizations, dependent: :destroy
  has_many :products, through: :categorizations

  def to_s
    self.name
  end	
end
