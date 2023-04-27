local awful = require("awful")

-- return a keygrabber which do incremental keybinding
-- @param keybinding: a table that define the keybinding
-- @param persistkey: a string represent the persist toggle key (eg: Super_L)
-- @param stopkey: incase you (somehow) suddenly don't know what is happening and want to stop
local chainkey = function(keybinding, persistkey, stopkey)
   stopkey = stopkey or "Escape"

   local grabber = awful.keygrabber{
      stop_key = stopkey,
      keypressed_callback = function(self)
         -- keyreleased_callback also catch the keybinding when you press the root key to start itself
         self.started = true
      end,
      keyreleased_callback = function(self, _, key, _)
         -- should grabber stop or not
         local stop
         -- skip the root keybinding to start the grabber..
         if self.started then
            -- convert number key to number...
            key = (key >= '0' and key <= '9') and tonumber(key) or key

            -- get the next key in the chain
            self.currentchain = self.currentchain[key]

            -- if the key binding is a function then call it
            -- if the keybinding isa table
            -- there's a sub keybinding inside
            -- if next keybinding in the chain is nothing
            -- it means that the key binding doesn't exist
            if type(self.currentchain) == "function" then
               self.currentchain()
               stop = true
            elseif type(self.currentchain) == "table" then
               stop = false
            else
               stop = true
            end

            -- if persist is activated then don't stop
            -- just reset the keys
            -- if not then it's time to stop
            if stop then
               if self.persist then
                  self.currentchain = keybinding
               else
                  self:stop()
               end
            end
         end
      end,
   }

   -- add a persist lock toggle key
   if persistkey then
      keybinding[persistkey] = function()
         grabber.persist = not grabber.persist

         -- expected behaviour
         -- when persistant key grabbing end
         -- it means that you're done with what ever your are doing
         -- so just stop the grabber
         if not grabber.persist then
            grabber:stop()
         else
            -- after the persist change, we need to reset the key since we pressed it once..
            -- except if you intentionally do something with it though
            if type(grabber.currentchain) ~= "function" or type(grabber.currentchain) ~= "table" then
               grabber.currentchain = keybinding
            end
         end
      end
   end


   -- default persist is false
   grabber.persist = false

   -- change the start status to true
   grabber:connect_signal("stopped", function(self)
      self.started = false
      self.persist = false
   end)

   -- reset the key when the grabber start
   grabber:connect_signal("started", function(self)
      self.currentchain = keybinding
   end)

   return grabber
end

return chainkey
