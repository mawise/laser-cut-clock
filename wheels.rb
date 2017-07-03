require './gear.rb'

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

def draw_minute_wheel(cx, cy)
  irad = 9
  orad = 15.9
  teeth = 10
  hole_rad = 4

  Gear.new(cx, cy, irad, orad, teeth, Tooth::TRIANGLE, Gear::STYLE).draw +
  circle(cx, cy, hole_rad, "mm", Style::CIRCLE)
end

def draw_reduction_wheel(cx, cy)
  irad = 24
  orad = 29.6
  teeth = 20
  
  small_irad = 4.23
  small_orad = 6.9
  small_teeth = 8

  Gear.new(cx, cy, irad, orad, teeth, Tooth::TRIANGLE, Gear::STYLE).draw +
  Gear.new(cx, cy, small_irad, small_orad, small_teeth, Tooth::TRIANGLE, Gear::STYLE).draw
end

def draw_hour_wheel(cx, cy)
  irad = 32.8
  orad = 37
  teeth = 48
  hole_rad = 4.75
  gap_irad = 9.5
  gap_orad = 22.75

  Gear.new(cx, cy, irad, orad, teeth, Tooth::TRIANGLE, Gear::STYLE).draw +
  circle(cx, cy, hole_rad, "mm", Style::CIRCLE) +
  gear_holes(cx, cy, gap_irad, gap_orad, "mm", Style::LINE)
end

