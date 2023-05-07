local love = require('love')

require('game_manager')
require('interface/interface_manager')

function love.load()
  game_manager = GameManager()
  interface_manager = InterfaceManager()

  interface_manager:load()
  game_manager:load()
end

function love.update(dt)
  game_manager:update(dt)
  interface_manager:update(dt, game_manager.state, game_manager.screen)
end

function love.draw()
  interface_manager:draw(game_manager.state, game_manager.screen)

  love.graphics.print('FPS: ' .. love.timer.getFPS() .. ' | Game_manager State: ' .. game_manager.state .. ' | Game_manager Screen: ' .. game_manager.screen)
end

function love.keyreleased(key)
  if key == 'escape' then
    game_manager:unlock_key('escape')
  end

  if key == 'i' then
    game_manager:unlock_key('i')
  end

  if key == 'm' then
    game_manager:unlock_key('m')
  end

  if key == 'c' then
    game_manager:unlock_key('c')
  end

  if key == 'return' then
    game_manager:unlock_key('kreturn')
  end
end
