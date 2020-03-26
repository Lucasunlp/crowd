class Person < ActiveRecord::Base
  self.abstract_class = true

  validates :first_name, :last_name, :aliases, presence: true
end
