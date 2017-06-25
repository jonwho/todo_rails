class Task < ApplicationRecord
  belongs_to :todo

  enum status: [:incomplete, :complete]
end
