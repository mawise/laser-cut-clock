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
  range = 100
  (0...range).each do |n|
    t = theta(n, range) 
    t2 = theta(n+1, range)
    start = rad_to_xy(cx, cy, t, r)
    stop = rad_to_xy(cx, cy, t2, r)
    ret += line(start[0], start[1], stop[0], stop[1], unit, style)
  end
  ret
end

def gear_holes(cx, cy, r1, r2, unit, style)
  
end
