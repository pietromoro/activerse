module Activerse
  class Setting < ApplicationRecord
    validates :key, presence: true, uniqueness: true
    validates :value, presence: true
  end
end
