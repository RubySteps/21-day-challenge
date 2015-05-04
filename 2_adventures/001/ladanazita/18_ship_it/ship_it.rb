def ship_it(volume)
  v= volume.to_i
  cube_height = (v ** (1/3.0)).round(2)
  cylinder_radius = (2*Math.sqrt((v/Math::PI)/cube_height)).round(2)
  sphere = (Math.cbrt((3*v)/(4*Math::PI))).round(2)
  cone_radius = (Math.sqrt(v/(cube_height*Math::PI))).round(2)
  cone_height= (cube_height*3).round(2)
  puts "cube: #{cube_height}m width, #{cube_height}m height, #{cube_height}m tall. cylinder: #{cube_height}m tall, diameter of #{cylinder_radius}. sphere: #{sphere}. Cone: #{cone_height} tall, #{cone_radius} radius."
end