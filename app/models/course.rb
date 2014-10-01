class Course < ActiveRecord::Base
  belongs_to :institution, inverse_of: :courses

  validates :name, presence: true
  validates :institution_id, presence: true
end
