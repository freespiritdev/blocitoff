class Task < ActiveRecord::Base

  validates :description, length: {minimum: 1 }, presence: true
  belongs_to :user

  default_scope { order('created_at DESC') }

  


end
