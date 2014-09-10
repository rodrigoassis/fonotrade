class Plan < ActiveRecord::Base
  belongs_to :professional, inverse_of: :plans

  validates :name, presence: true

  rails_admin do
    list do
      field :name
      field :professional
      field :created_at
      field :updated_at
    end

    modal do
      configure :professional do
        hide
      end
    end
  end
end
