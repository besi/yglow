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

    last_color = self.lamps.last.color rescue 'blue'
    lamp.stage = self
    lamp.save!

    new_color = self.lamps.present? ? next_color(last_color) : colors.first
    lamp.update_attribute(:color, new_color)
  end

  def next_color(color)
    colors[(colors.index(color) + 1) % colors.count]
  end
end