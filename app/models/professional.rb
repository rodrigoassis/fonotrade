class Professional < ActiveRecord::Base

  has_many :plans, inverse_of: :professionals, dependent: :destroy

  validates :name, :email, :crfa, :cpf, :cep, :state, :city, :address, :neighborhood, presence: true
  validates :cep, format: { with: /\A\d{5}-\d{3}\z/, message: I18n.t('errors.messages.wrong_format', correct_format: '99999-999') }
  validates :cpf, format: { with: /\A\d{3}.\d{3}.\d{3}-\d{2}\z/, message: I18n.t('errors.messages.wrong_format', correct_format: '999.999.999-99') }
  validates :cpf, :crfa, :email, uniqueness: true

  def city_enum
    I18n.t('cities')
  end

  def state_enum
    I18n.t('states')
  end

  rails_admin do
    list do
      field :active
      field :name
      field :email
      field :cpf
      field :crfa
      field :state
      field :city
      field :neighborhood
    end
  end

end
