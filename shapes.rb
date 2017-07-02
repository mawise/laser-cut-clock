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
    [0.5,1],
    [1,0]
  ]
  SAWTOOTH = [
    [0,0],
    [1,1],
    [1,0]
  ]
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
