def draw_motor_wheel(cx, cy)
  id = 69.5
  od = 73.5
  teeth = 72
  Gear.new(cx, cy, id, od, teeth, Tooth::SQUARE, Gear::STYLE).draw_square
end

def draw_middle_wheel(cx, cy)
  id = 41.5
  od = 46
  teeth = 48

  small_id = 3.7
  small_od = 8.47
  small_teeth = 8

  Gear.new(cx, cy, id, od, teeth, Tooth::ROUND_SQUARE, Gear::STYLE).draw_square +
  Gear.new(cx, cy, small_id, small_od, small_teeth, Tooth::TRIANGLE, Gear::STYLE).draw
end

def draw_escapement(cx, cy)
  id = 23.81
  od = 29.63
  teeth = 24

  small_id = 3.7
  small_od = 8.47
  small_teeth = 8

  Gear.new(cx, cy, id, od, teeth, Tooth::SAWTOOTH, Gear::STYLE).draw +
  Gear.new(cx, cy, small_id, small_od, small_teeth, Tooth::TRIANGLE, Gear::STYLE).draw
end
