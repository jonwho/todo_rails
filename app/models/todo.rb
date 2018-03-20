class Todo < ApplicationRecord
  belongs_to :user

  validates :description, presence: true

  enum status: [:incomplete, :complete]

  before_save :default_values

  private

  def default_values
    self.status ||= 0
  end
end
