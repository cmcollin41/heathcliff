class Prompt < ActiveRecord::Base
	has_many :assignments
	has_many :members, through: :assignments
	has_many :keywords

	enum status: [:open, :accepted, :submitted, :review, :complete, :cancelled]

	validate :proper_date
	validates_presence_of :due_date
	validates_presence_of :category
	validates_presence_of :description
	validates_presence_of :target_audience
	validates_presence_of :length

  accepts_nested_attributes_for :keywords, allow_destroy: true


  def proper_date
  	if due_date <= 5.days.from_now
  		self.errors.add(:due_date, "We need at least 5 days to complete your article :(")
  	end
  end

end
