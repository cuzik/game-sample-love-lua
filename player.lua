function Player()
  local player = {}

  player.load = function(self)
    self.x = 400
    self.y = 200
    self.velocity = 200
  end

  player.update = function(self, dt)
    local move = self:move()

    self.x = self.x + move.x * dt * self.velocity
    self.y = self.y + move.y * dt * self.velocity
  end

  player.draw = function(self)
    love.graphics.rectangle("line", self.x, self.y, 32, 32)
  end

  player.move = function(self)
    local move = {}
    move.x = 0
    move.y = 0

    if love.keyboard.isDown("right") then
      move.x = move.x + 1
    end

    if love.keyboard.isDown("left") then
      move.x = move.x - 1
    end

    if love.keyboard.isDown("down") then
      move.y = move.y + 1
    end

    if love.keyboard.isDown("up") then
      move.y = move.y - 1
    end

    return move
  end

  return player
end

