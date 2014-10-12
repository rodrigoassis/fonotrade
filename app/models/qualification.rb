class Qualification < ActiveRecord::Base
  has_many :experiences, inverse_of: :course

  validates :name, presence: true, uniqueness: true

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
