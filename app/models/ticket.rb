class Ticket < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  belongs_to :assignee, class_name: 'User', foreign_key: 'assignee_id'

  def assign(user)
    self.assignee = user
  end
end
