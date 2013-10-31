class Poll < ActiveRecord::Base
  belongs_to :admin
  has_many :options
  validates :question, presence: true
  validates :deadline, date: { after: :start_date, message: "Deadline must be after the start date"}
end
