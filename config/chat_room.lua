local ChatRoom = class("ChatRoom")
local M = {}

function ChatRoom:initialize()
  print("initialize!!!!!!!!!!!!")
  self.persons = {}
  self.subscribers = {}
end

function ChatRoom:broadcast(package)
  local time = turbo.util.gettimeofday()
  for i = 1, #self.subscribers do
    local sub = self.subscribers[i]
    sub.socket:write_message(turbo.escape.json_encode {
      package = package,
      time = time
    })
  end
end

function ChatRoom:add(nick)
  for i=1, #self.persons do
    if self.persons[i].nick == nick then
      return false
    end
  end
  self.persons[#self.persons+1] = {nick=nick}
  return true
end

function ChatRoom:is_registered(nick)
  for i=1, #self.persons do
    if self.persons[i].nick == nick then
      return true
    end
  end
end

function ChatRoom:subscribe(nick, socket)
  print("1++++++++++++++++++++++++++++")
  print(nick)
  print("2++++++++++++++++++++++++++++")
  print(socket)
  print("3++++++++++++++++++++++++++++")
  table.insert(self.subscribers, {nick=nick, socket=socket})
  -- Send a partcipant joined message.
  self:broadcast({
    type = "participant-joined",
    data = nick
  })
  self:update_participants()
end

function ChatRoom:update_participants()
  -- Send a updated participant list.
  local nicks = {}
  for i = 1, #self.subscribers do
    nicks[#nicks+1] = self.subscribers[i].nick
  end
  self:broadcast({
    type = "participant-update",
    data = nicks
  })
end

function ChatRoom:unsubscribe(nick, socket)
  -- NYI, remove nick and socket object.
  for i = 1, #self.subscribers do
    if self.subscribers[i].nick == nick then
      assert(self.subscribers[i].socket == socket, "Uh oh...")
      table.remove(self.subscribers, i)
    end
  end
  self:broadcast({
    type = "participant-left",
    data = nick
  })
  self:update_participants()
end

M.ChatRoom = ChatRoom
return M