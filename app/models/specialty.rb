class Specialty < ActiveRecord::Base
  has_and_belongs_to_many :specialties

  validates :name, presence: true

  rails_admin do
    list do
      field :name
      field :created_at
      field :updated_at
    end
  end

end
