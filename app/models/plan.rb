class Plan < ActiveRecord::Base
  belongs_to :professional, inverse_of: :plans

  validates :name, :professional, presence: true
end
