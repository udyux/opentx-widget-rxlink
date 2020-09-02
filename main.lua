--[[ RxLink v1.2

https://github.com/udyux/opentx-widget-rxlink
Copyright 2020 | Nicolas Udy | MIT License

DISCLAIMER
While this script relies on telemetry, it may not reflect the actual link quality state and should
not be used in situations where reliable data is critical. It is the user's responsibility to check
for correct operation before use. Please rely on tools supported by your TX/RX manufacturer.

**IF IN DOUBT DO NOT FLY!**
]]

local inputs = {
  { "Color", COLOR, WHITE },
  { "NoRxColor", COLOR, LIGHTGREY },
  { "WarnColor", COLOR, YELLOW },
  { "CritColor", COLOR, DARKRED }
}

local function create(zone, options)
  local xflqSource = getFieldInfo("RQly")
  local xflq = xflqSource ~= nil and xflqSource.id or false
  return { zone = zone, options = options, xflq = xflq }
end

local function update(widget, options)
  widget.options = options
end

local function background() end

local function refresh(widget)
  -- check tx antenna physical state
  if getRAS() > 51 then
    lcd.setColor(CUSTOM_COLOR, widget.options.CritColor)
    lcd.drawText(widget.zone.x + 34, widget.zone.y - 2, "CHECK TX", CUSTOM_COLOR)
    lcd.drawText(widget.zone.x + 17, widget.zone.y + 12, "ANTENNA", MIDSIZE + CUSTOM_COLOR)
    return
  end

  local isCrossfire = widget.xflq ~= false
  local rssi, rssiWarn, rssiCrit = getRSSI()
  local label = isCrossfire and "LQ" or "RSSI"

  local lqValue = rssi == 0 and "--"
    or isCrossfire and getValue(widget.xflq).."%"
    or rssi.."dB"

  local statusColor = rssi == 0 and widget.options.NoRxColor
    or rssi > rssiWarn and widget.options.Color
    or rssi > rssiCrit and widget.options.WarnColor
    or widget.options.CritColor

  lcd.setColor(CUSTOM_COLOR, widget.options.Color)
  lcd.drawText(widget.zone.x, widget.zone.y + 4, label, MIDSIZE + CUSTOM_COLOR)

  lcd.setColor(CUSTOM_COLOR, statusColor)
  lcd.drawText(widget.zone.x + widget.zone.w, widget.zone.y, lqValue, RIGHT + DBLSIZE + CUSTOM_COLOR)
end

return {
  name = "RxLink",
  options = inputs,
  create = create,
  background = background,
  update = update,
  refresh = refresh
}
