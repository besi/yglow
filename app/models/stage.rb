class Stage < ActiveRecord::Base

  has_many :lamps

  def hello(lamp)
    @colors = %w(blue green yellow orange red violet)

    lamp.stage = self
    lamp.color = @colors[self.lamps.count % @colors.count]
    lamp.save!
  end
end