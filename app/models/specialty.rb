class Specialty < ActiveRecord::Base
  validates :name, presence: true

  rails_admin do
    list do
      field :name
      field :created_at
      field :updated_at
    end
  end

end
