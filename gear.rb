require './shapes.rb'

class Gear
  STYLE = "style=\"stroke:black;stroke-width:0.1mm\""

  def initialize(cx, cy, id, od, teeth, tooth_points, style)
    @cx = cx
    @cy = cy
    @id = id
    @od = od
    @teeth = teeth
    @tooth_points = tooth_points
    @unit = "mm"
    @style = style
  end

  def draw
    ret = ""
    (0...@teeth).each do |n|
      points = @tooth_points.map{|x,y| rad_to_xy(@cx,@cy,theta((n-0.5)+x,@teeth),@id+y*(@od-@id))}
      points.each_with_index do |pair, i|
        if (i+1 < points.size)
          dest = points[i+1]
          ret += line(pair, dest, @unit, @style)
        end
      end
    end
    ret + "\n"
  end

  def from_center(point)
    [@cx + point[0], @cy + point[1]]
  end

  # rotate clockwise about the origin
  def rotate(x,y,theta)
    [x*-1*Math.cos(theta) + y*Math.sin(theta), x*-1*Math.sin(theta) + y*-1*Math.cos(theta)]
  end

  def draw_square
    ret = ""
    offset = @id * Math.tan(Math::PI/@teeth)
    scaled_points = @tooth_points.map{|x,y| [x*2*offset-offset, @id + y * (@od-@id)]}

    (0...@teeth).each do |n|
      points = scaled_points.map{|x,y| rotate(x,y,theta(n,@teeth))}
      points.each_with_index do |pair, i|
        if (i+1 < points.size)
          dest = points[i+1]
          ret += line(from_center(pair), from_center(dest), @unit, @style)
        end
      end
    end
    ret +"\n"
  end

end

