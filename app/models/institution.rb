class Institution < ActiveRecord::Base
  has_many :experiences, inverse_of: :course

  validates :name, presence: true, uniqueness: true

  rails_admin do
    list do
      field :active
      field :name
      field :created_at
      field :updated_at
    end
    edit do
      field :active
      field :name
    end
    modal do
      configure :active do
        hide
      end
    end
  end
end
