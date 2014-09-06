class Experience < ActiveRecord::Base

  belongs_to :professional, inverse_of: :experiences

  validates :name, :professional, :year, :institute, presence: true
  validates :year, numericality: { only_integer: true, greater_than: 1000}

  rails_admin do
    list do
      field :name
      field :professional
      field :institute
      field :year
      field :created_at
      field :updated_at
    end
  end
end
