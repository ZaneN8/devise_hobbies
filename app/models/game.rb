class Game < ApplicationRecord
  belongs_to :user

  def info
    "#{self.name}"
  end
end