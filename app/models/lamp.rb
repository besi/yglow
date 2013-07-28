class Lamp < ActiveRecord::Base

belongs_to :stage

def activate
  stage = Stage.find_or_create_by_active(true)
  stage.hello(self)
end

def identifier
  self.id
end

end
