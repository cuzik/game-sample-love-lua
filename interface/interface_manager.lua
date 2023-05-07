require('interface/config_interface')
require('interface/inventory_interface')
require('interface/map_interface')
require('interface/main_menu_interface')
require('interface/game_interface')
require('globals')

function InterfaceManager()
  local interface = {
    config = ConfigInterface(),
    game = GameInterface(),
    inventory = InventoryInterface(),
    main_menu = MainMenuInterface(),
    map = MapInterface()
  }

  interface.load = function(self)
    self.current_interface = 'main_menu'

    interface.config:load()
    interface.inventory:load()
    interface.map:load()
    interface.main_menu:load()
    interface.game:load()
  end

  interface.update = function(self, dt, state, screen)
    self[screen]:update(dt)

    if state == globals.valid_states.play then
      self.game:update(dt)
    end
  end

  interface.draw = function(self, state, screen)
    self[screen]:draw()

    if state == globals.valid_states.play then
      self.game:draw()
    end
  end

  return interface
end

