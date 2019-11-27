hs.window.animationDuration = 0

units = {
  right30       = { x = 0.70, y = 0.00, w = 0.30, h = 1.00 },
  right50       = { x = 0.50, y = 0.00, w = 0.50, h = 1.00 },
  right70       = { x = 0.30, y = 0.00, w = 0.70, h = 1.00 },
  left70        = { x = 0.00, y = 0.00, w = 0.70, h = 1.00 },
  left50        = { x = 0.00, y = 0.00, w = 0.50, h = 1.00 },
  left30        = { x = 0.00, y = 0.00, w = 0.30, h = 1.00 },
  top50         = { x = 0.00, y = 0.00, w = 1.00, h = 0.50 },
  bot50         = { x = 0.00, y = 0.50, w = 1.00, h = 0.50 },
  upright30     = { x = 0.70, y = 0.00, w = 0.30, h = 0.50 },
  botright30    = { x = 0.70, y = 0.50, w = 0.30, h = 0.50 },
  upleft70      = { x = 0.00, y = 0.00, w = 0.70, h = 0.50 },
  botleft70     = { x = 0.00, y = 0.50, w = 0.70, h = 0.50 },
  maximum       = { x = 0.00, y = 0.00, w = 1.00, h = 1.00 },
  center        = { x = 0.15, y = 0.15, w = 0.70, h = 0.70 }
}

mash = { 'alt', 'ctrl', 'cmd' }

function close(number, value, limit)
  return math.abs(number - value) <= (limit or 0.01)
end

hs.hotkey.bind(mash, 'l', function()
  window = hs.window.focusedWindow()
  screen = window:screen()
  screenFrame = screen:frame()
  windowFrame = window:frame()
  windowUnitRect = windowFrame:toUnitRect(screenFrame)
  if close(windowUnitRect.x, 0.70) then
    window:move(units.right70,    nil, true)
  elseif close(windowUnitRect.x, 0.50) then
    window:move(units.right30,    nil, true)
  elseif close(windowUnitRect.x, 0.30) then
    window:move(units.right50,    nil, true)
  else
    window:move(units.right70,    nil, true)
  end
end)
hs.hotkey.bind(mash, 'h', function()
  window = hs.window.focusedWindow()
  screen = window:screen()
  screenFrame = screen:frame()
  windowFrame = window:frame()
  windowUnitRect = windowFrame:toUnitRect(screenFrame)
  if close(windowUnitRect.x, 0.00) and close(windowUnitRect.w, 0.70) then
    window:move(units.left50,    nil, true)
  elseif close(windowUnitRect.x, 0.00) and close(windowUnitRect.w, 0.50) then
    window:move(units.left30,    nil, true)
  elseif close(windowUnitRect.x, 0.00) and close(windowUnitRect.w, 0.30) then
    window:move(units.left70,    nil, true)
  else
    window:move(units.left70,    nil, true)
  end
end)
hs.hotkey.bind(mash, 'k', function() hs.window.focusedWindow():move(units.top50,      nil, true) end)
hs.hotkey.bind(mash, 'j', function() hs.window.focusedWindow():move(units.bot50,      nil, true) end)
hs.hotkey.bind(mash, ']', function() hs.window.focusedWindow():move(units.upright30,  nil, true) end)
hs.hotkey.bind(mash, '[', function() hs.window.focusedWindow():move(units.upleft70,   nil, true) end)
hs.hotkey.bind(mash, ';', function() hs.window.focusedWindow():move(units.botleft70,  nil, true) end)
hs.hotkey.bind(mash, "'", function() hs.window.focusedWindow():move(units.botright30, nil, true) end)
hs.hotkey.bind(mash, 'm', function() hs.window.focusedWindow():move(units.maximum,    nil, true) end)
hs.hotkey.bind(mash, 'c', function()
  hs.window.focusedWindow():move(units.center,    nil, true)
end)

