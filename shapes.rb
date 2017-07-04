class Tooth
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
    [0.45,1],
    [0.55,1],
    [1,0]
  ]
  SAWTOOTH = [
    [0,0],
    [1,1],
    [1,0]
  ]
end

class Style
  LINE = "style=\"stroke:black;stroke-width:0.1mm\""
  CIRCLE = LINE[0...LINE.size-1] + ";fill:none\""
end

def line(x1,y1,x2,y2,unit,style)
 "<line x1=\"#{x1}#{unit}\" y1=\"#{y1}#{unit}\" x2=\"#{x2}#{unit}\" y2=\"#{y2}#{unit}\" #{style} />\n"
end

def line_points(start, stop, unit, style)
  line(start[0], start[1], stop[0], stop[1], unit, style)
end

def polygon(points, unit, style)
  ret = ""
  (0...points.size).each do |n|
    ret += line_points(points[n], points[(n+1)%points.size], unit, style)
  end
  ret
end

def box(x1,y1,x2,y2,unit,style)
  line(x1,y1,x1,y2,unit,style) +
  line(x1,y2,x2,y2,unit,style) +
  line(x2,y2,x2,y1,unit,style) +
  line(x2,y1,x1,y1,unit,style)
end

def circle(cx, cy, r, unit, style)
  "<circle cx=\"#{cx}#{unit}\" cy=\"#{cy}#{unit}\" r=\"#{r}#{unit}\" #{style} />\n"
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

def arc(cx, cy, r, start_angle, end_angle, unit, style)
  ret = ""
  range = end_angle - start_angle
  incr = range.to_f/100
  (start_angle...end_angle).step(incr) do |n|
    t = n 
    t2 = n+incr
    start = rad_to_xy(cx, cy, t, r)
    stop = rad_to_xy(cx, cy, t2, r)
    ret += line(start[0], start[1], stop[0], stop[1], unit, style)
  end
  ret
end

def gear_holes(cx, cy, r1, r2, unit, style)
  ret = ""
  [[0,2],[3,5],[6,8]].each do |start, stop| 
    theta1 = theta(start-Math::PI/18, 9)
    theta2 = theta(stop-Math::PI/18, 9)
    in1 = rad_to_xy(cx, cy, theta1, r1)
    out1 = rad_to_xy(cx, cy, theta1, r2)
    in2 = rad_to_xy(cx, cy, theta2, r1)
    out2 = rad_to_xy(cx, cy, theta2, r2)
    ret += line(in1[0], in1[1], out1[0], out1[1], unit, style)
    ret += line(in2[0], in2[1], out2[0], out2[1], unit, style)
    ret += arc(cx, cy, r1, theta1, theta2, unit, style)
    ret += arc(cx, cy, r2, theta1, theta2, unit, style)
  end
  ret
end
