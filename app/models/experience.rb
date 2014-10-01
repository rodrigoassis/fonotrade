class Experience < ActiveRecord::Base

  belongs_to :professional, inverse_of: :experiences
  belongs_to :course, inverse_of: :experiences

  validates :professional, :year, :course, presence: true
  validates :year, presence: true, numericality: { only_integer: true, greater_than: 1000}

  def name
    course.name
  end

  def institution
    course.institution
  end

  rails_admin do
    visible false
    list do
      field :name
      field :professional
      field :year
      field :created_at
      field :updated_at
    end
  end
end
