class Task < ActiveRecord::Base

  validates :name, length: {minimum: 1 }, presence: true
  belongs_to :user

  default_scope { order('created_at DESC') }

  


end
