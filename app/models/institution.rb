class Institution < ActiveRecord::Base
  has_many :courses, inverse_of: :institution

  validates :name, presence: true, uniqueness: true
end
