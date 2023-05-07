require('globals')

local love = require('love')

function GameManager()
  local game_manager = {}

  game_manager.load = function(self)
    self.lock_keys = {
      escape = false,
      kreturn = false,
      c = false,
      i = false,
      m = false
    }
    self:pause()
    self.screen = 'main_menu'
  end

  game_manager.update = function(self, dt)
    if love.keyboard.isDown('return') and not game_manager:is_key_locked('return') and self.screen == globals.valid_screens.main_menu then
      game_manager:lock_key('kreturn')
      self:play()
      self:select_screen(globals.valid_screens.game)
    end

    if love.keyboard.isDown('i') and not game_manager:is_key_locked('i') and self.screen ~= globals.valid_screens.main_menu then
      game_manager:lock_key('i')
      if self.screen == globals.valid_screens.inventory then
        self:play()
        self:select_screen(globals.valid_screens.game)
      else
        self:pause()
        self:select_screen(globals.valid_screens.inventory)
      end
    end

    if love.keyboard.isDown('m') and not game_manager:is_key_locked('m') and self.screen ~= globals.valid_screens.main_menu then
      game_manager:lock_key('m')
      if self.screen == globals.valid_screens.map then
        self:play()
        self:select_screen(globals.valid_screens.game)
      else
        self:pause()
        self:select_screen(globals.valid_screens.map)
      end
    end

    if love.keyboard.isDown('escape') and not game_manager:is_key_locked('escape') and self.screen ~= globals.valid_screens.main_menu then
      game_manager:lock_key('escape')
      if self:is_paused() then
        self:play()
        self:select_screen(globals.valid_screens.game)
      else
        self:pause()
        self:select_screen(globals.valid_screens.config)
      end
    end

    if love.keyboard.isDown('c') and not game_manager:is_key_locked('c') and self.screen ~= globals.valid_screens.main_menu and self:is_paused() then
      game_manager:lock_key('c')
      if self.screen == globals.valid_screens.config then
        self:play()
        self:select_screen(globals.valid_screens.game)
      else
        self:pause()
        self:select_screen(globals.valid_screens.config)
      end
    end
  end

  game_manager.lock_key = function(self, key)
    self.lock_keys[key] = true
  end

  game_manager.unlock_key = function(self, key)
    self.lock_keys[key] = false
  end

  game_manager.is_key_locked = function(self, key)
    return self.lock_keys[key]
  end

  game_manager.pause = function(self)
    self.state = globals.valid_states.paused
  end

  game_manager.is_paused = function(self)
    return self.state == globals.valid_states.paused
  end

  game_manager.play = function(self)
    self.state = globals.valid_states.play
  end

  game_manager.is_playing = function(self)
    return self.state == globals.valid_states.play
  end

  game_manager.select_screen = function(self, new_screen)
    if globals.valid_screens[new_screen] then
      self.screen = globals.valid_screens[new_screen]
    end
  end

  return game_manager
end
