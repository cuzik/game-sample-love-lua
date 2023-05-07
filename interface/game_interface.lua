require('../player')

function GameInterface()
  local interface = {}

  interface.load = function(self)
    player = Player()

    player:load()
  end

  interface.update = function(self, dt)
    player:update(dt)
  end

  interface.draw = function(self)
    love.graphics.setColor(255,255,255)
    love.graphics.rectangle("fill", 850, 10, 10, 10)
    love.graphics.setColor(255,255,255)

    player:draw()
  end

  return interface
end

