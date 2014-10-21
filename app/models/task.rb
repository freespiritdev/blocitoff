class Task < ActiveRecord::Base

  validates :name, length: {minimum: 1 }, presence: true
  belongs_to :user
  has_many :users #not sure this is needed added 10/20/14
  default_scope { order('created_at DESC') }

  


end
