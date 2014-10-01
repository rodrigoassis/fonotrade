class Course < ActiveRecord::Base
  belongs_to :institution, inverse_of: :courses
  has_many :experiences, inverse_of: :course

  validates :name, presence: true
  validates :institution_id, presence: true
end
