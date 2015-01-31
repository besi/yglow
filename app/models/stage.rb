class Stage < ActiveRecord::Base

  has_many :lamps

  def colors
    %w(blue green yellow orange red violet)
  end

  def rotate_colors
    self.lamps.map do |lamp|
      new_color = next_color(lamp.color)
      lamp.update_attribute(:color, new_color)
    end
  end

  def hello(lamp)

    new_color = self.lamps.present? ? next_color(self.lamps.last.color) : colors.first

    lamp.stage = self
    lamp.color = new_color
    lamp.save!
  end

  def next_color(color)
    colors[(colors.index(color) + 1) % colors.count]
  end
end