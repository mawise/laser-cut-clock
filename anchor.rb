require './shapes.rb'

def draw_anchor(cx, cy)
  points = [
    [cx, cy],
    [cx+13.45, cy+17],
    [cx-18.85, cy+17]
  ]
  polygon(points, "mm", Style::LINE)
end
