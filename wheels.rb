def draw_motor_wheel(cx, cy)
  id = 20
  od = 22
  teeth = 72
  Gear.new(cx, cy, id, od, teeth, Gear::SQUARE, Gear::STYLE).draw_square
end

def draw_middle_wheel(cx, cy)
  id = 20
  od = 22
  teeth = 48

  small_id = 2
  small_od = 4
  small_teeth = 8

  Gear.new(cx, cy, id, od, teeth, Gear::ROUND_SQUARE, Gear::STYLE).draw_square +
  "\n" +
  Gear.new(cx, cy, small_id, small_od, small_teeth, Gear::TRIANGLE, Gear::STYLE).draw
end

def draw_escapement(cx, cy)
  id = 15
  od = 17
  teeth = 24

  small_id = 2
  small_od = 4
  small_teeth = 8

  Gear.new(cx, cy, id, od, teeth, Gear::SAWTOOTH, Gear::STYLE).draw +
  "\n" +
  Gear.new(cx, cy, small_id, small_od, small_teeth, Gear::TRIANGLE, Gear::STYLE).draw
end
