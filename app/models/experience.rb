class Experience < ActiveRecord::Base

  belongs_to :professional, inverse_of: :experiences
  belongs_to :course, inverse_of: :experiences
  belongs_to :institution, inverse_of: :experiences
  belongs_to :qualification, inverse_of: :experiences

  validates :professional, :year, :course, :institution, :qualification, presence: true
  validates :year, presence: true, numericality: {only_integer: true, greater_than: 1000}

  after_initialize do
    if new_record?
      self.institution ||= Institution.first
      self.course ||= Course.first
      self.qualification ||= Qualification.first
    end
  end

  def name
    course.name
  end

  def year_enum
    (Date.today.year-20..Date.today.year).to_a.reverse
  end

  rails_admin do
    visible false
    list do
      field :name
      field :professional
      field :year
      field :created_at
      field :updated_at
    end
    edit do
      field :institution
      field :qualification
      field :course
      field :year
      field :comments
    end
    nested do
      configure :institution do
        inline_edit false
      end
      configure :course do
        inline_edit false
      end
      configure :qualification do
        inline_edit false
        inline_add false
      end
    end
  end
end
