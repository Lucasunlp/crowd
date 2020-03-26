class MovieWorker < ApplicationRecord
  belongs_to :actress
  belongs_to :actor
end
