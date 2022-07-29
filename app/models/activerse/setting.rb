module Activerse
  class Setting < ApplicationRecord
    validates :key, :value, presence: true
    validate_uniqueness_of :key
  end
end
