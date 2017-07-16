require './shapes.rb'

def draw_anchor(cx, cy)
  points = [
    [13.45, 17],
#    [-18.85, 17],
    [26,3],
    [0, -6],
    [-32, 4],
    [-18.85, 17],
    [-23, 6],
    [18, 6]
  ]
  centered_points = points.map{|p| [cx + p[0], cy + p[1]]}
  polygon(centered_points, "mm", Style::LINE)
end
