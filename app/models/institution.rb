class Institution < ActiveRecord::Base
  has_many :courses, inverse_of: :institution

  validates :name, presence: true, uniqueness: true

  rails_admin do
    modal do
      configure :courses do
        hide
      end
    end
  end
end
