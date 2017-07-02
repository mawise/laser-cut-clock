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

  # center x, centery, theta, radius
  def rad_to_xy(cx,cy,t,r)
    x = r*Math.sin(t)
    y = -1*r*Math.cos(t)
    [cx+x,cy+y]
  end
  
  # input tooth number and total number of teeth
  # output position of tooth in radians
  # accepts fractional tooth number
  def theta(n,teeth)
    n.to_f/teeth * (2*Math::PI)
  end

  def draw
    ret = ""
    (0...@teeth).each do |n|
      points = @tooth_points.map{|x,y| rad_to_xy(@cx,@cy,theta((n-0.5)+x,@teeth),@id+y*(@od-@id))}
      points.each_with_index do |pair, i|
        if (i+1 < points.size)
          dest = points[i+1]
          ret += line(pair[0], pair[1], dest[0], dest[1], @unit, @style)
        end
      end
    end
    ret + "\n"
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
          ret += line(@cx+pair[0], @cy+pair[1], @cx+dest[0], @cy+dest[1], @unit, @style)
        end
      end
    end
    ret +"\n"
  end

  ### Tooth Shapes

  SQUARE  = [
    [0,0],
    [0.25,0],
    [0.25,1],
    [0.75,1],
    [0.75, 0],
    [1,0]
  ]

  ROUND_SQUARE = [
    [0,0],
    [0.25,0],
    [0.25,0.75],
    [0.28349364905389035,0.875],
    [0.375,0.9665063509461097],
    [0.5,1.0],
    [0.625,0.9665063509461097],
    [0.7165063509461096,0.875],
    [0.75,0.75],
    [0.75, 0],
    [1,0]
  ]

  TRIANGLE = [
    [0,0],
    [0.5,1],
    [1,0]
  ]

  SAWTOOTH = [
    [0,0],
    [1,1],
    [1,0]
  ]
end

