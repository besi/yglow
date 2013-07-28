class LampsController < ApplicationController

  def register
    lamp = Lamp.new
    Stage.where(active: true).first_or_create.hello(lamp)
    render text: lamp.to_json
  end

  def show
    lamp = Lamp.find(params[:id])
    render text: lamp.to_json
  end

  def client
  end
end
