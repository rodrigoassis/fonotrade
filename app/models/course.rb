class Course < ActiveRecord::Base
  belongs_to :institution, inverse_of: :courses
  has_many :experiences, inverse_of: :course

  validates :name, presence: true
  validates :institution_id, presence: true

  rails_admin do
    list do
      field :name
      field :created_at
      field :updated_at
    end
    edit do
      configure :experiences do
        hide
      end
    end
  end
end
