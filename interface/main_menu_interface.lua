function MainMenuInterface()
  local interface = {}

  interface.load = function(self)
    -- TODO
  end

  interface.update = function(self, dt)
    -- TODO
  end

  interface.draw = function(self)
    love.graphics.setColor(255,255,0)
    love.graphics.rectangle("fill", 800, 10, 10, 10)
    love.graphics.setColor(255,255,255)
  end

  return interface
end

