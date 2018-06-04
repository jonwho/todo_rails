class Todo < ApplicationRecord
  belongs_to :user

  validates :description, presence: true

  scope :deleted, -> { where(soft_deleted: true) }
  scope :not_deleted, -> { where(soft_deleted: false) }

  enum status: [:incomplete, :complete]

  def soft_delete
    self.soft_deleted = true
    save
  end
end
