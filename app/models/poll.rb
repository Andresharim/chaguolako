class Poll < ActiveRecord::Base
  belongs_to :admin

  validates :question, presence: true
end
