require './shapes.rb'

def front(x1,y1)
  box(x1, y1, x1+170, y1+270, "mm", Style::LINE) +
  box(x1+10, y1+10, x1+75, y1+260, "mm", Style::LINE) +
  box(x1+95, y1+10, x1+160, y1+260, "mm", Style::LINE)
end

def back(x1,y1)
  box(x1, y1, x1+170, y1+270, "mm", Style::LINE) +
  box(x1+10, y1+40, x1+75, y1+260, "mm", Style::LINE) +
  box(x1+95, y1+40, x1+160, y1+260, "mm", Style::LINE) +
  box(x1+10, y1+10, x1+160, y1+30, "mm", Style::LINE)
end
