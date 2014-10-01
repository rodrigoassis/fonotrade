class Course < ActiveRecord::Base
  belongs_to :institution, inverse_of: :courses
  has_many :experiences, inverse_of: :course

  validates :name, presence: true

  rails_admin do
    visible false
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
    modal do
      configure :institution do
        hide
      end
    end
  end
end
