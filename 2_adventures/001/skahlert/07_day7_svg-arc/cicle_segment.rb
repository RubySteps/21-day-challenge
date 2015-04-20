def svg_arc(radius,dimension, position,total=100)
  angle = (360 * position / total).ceil
  startAngle = -90
  endAngle = 0
  arcSweepFlag = angle > 180 ? '1,1' : '0,1'
  circleDimension = dimension;

  endAngle = startAngle + angle;

  x1 = (circleDimension + radius * Math.cos(Math::PI * startAngle / 180)).ceil
  y1 = (circleDimension + radius * Math.sin(Math::PI * startAngle / 180)).ceil
  x2 = (circleDimension + radius * Math.cos(Math::PI * endAngle / 180)).ceil
  y2 = (circleDimension + radius * Math.sin(Math::PI * endAngle / 180)).ceil

  "M#{x1},#{y1}  A#{radius},#{radius} 0 #{arcSweepFlag} #{x2},#{y2} "
end

def svg_percentage(percentage,args={})
  options = {dimensions:100,percentage:percentage,stroke_width:2}.merge(args)
  <<-eos
  <svg width="#{options[:dimensions]+options[:stroke_width]*2}" height="#{options[:dimensions]+options[:stroke_width]*2}">
    <path d="#{svg_arc((options[:dimensions]/2)-options[:stroke_width],options[:dimensions]/2,options[:percentage])}" stroke="lightblue" fill="none" style="stroke-width: #{options[:stroke_width]}px;"></path>
  </svg>
  eos
end


puts svg_percentage(79,stroke_width:4)
