class StagesController < ApplicationController

  def ping
    number = params[:number].to_i || 1
    number.times do
      Stage.all.map(&:rotate_colors)
    end

    render json: {message: "Rotated colors by #{number}"}
  end
end
