class Institution < ActiveRecord::Base
  has_many :courses, inverse_of: :institution

  validates :name, presence: true, uniqueness: true

  accepts_nested_attributes_for :courses, allow_destroy: true

  rails_admin do
    list do
      field :name
      field :created_at
      field :updated_at
    end
    edit do
      field :active
      field :name
      field :courses do
        nested_form false
      end
    end
    modal do
      configure :courses do
        hide
      end
    end
  end
end
