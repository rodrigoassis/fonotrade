class Institution < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  rails_admin do
    list do
      field :name
      field :created_at
      field :updated_at
    end
    edit do
      field :active
      field :name
    end
  end
end
