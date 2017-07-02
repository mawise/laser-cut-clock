def line(x1,y1,x2,y2,unit,style)
 "<line x1=\"#{x1}#{unit}\" y1=\"#{y1}#{unit}\" x2=\"#{x2}#{unit}\" y2=\"#{y2}#{unit}\" #{style} />\n"
end

def box(x1,y1,x2,y2,unit,style)
  line(x1,y1,x1,y2,unit,style) +
  line(x1,y2,x2,y2,unit,style) +
  line(x2,y2,x2,y1,unit,style) +
  line(x2,y1,x1,y1,unit,style)
end
