class Image
  attr_accessor :image, :location, :distance
  def initialize(table)
   @image = table
  end
  
  def output_image
    @image.each do |arr|
      puts arr.join(" ")
    end
  end

  def set_up(x, y)
    @image[x][y - 1] = 1 if y - 1 >= 0
    @image[x][y + 1] = 1 if y + 1 < @image[x].length 
    @image[x - 1][y] = 1 if x - 1 >= 0
    @image[x + 1][y] = 1 if x < @image[y].length
  end

  def position
    @location = []
    @image.each_with_index do |arr, x|
      arr.each_with_index do |values, y|
        if values == 1
          location.push [x, y]
        end
      end
    end
    @location
  end
    
  def blur(distance) 
    @distance = gets.chomp.to_i
    @distance.times do
      position.each do |x_value, y_value|
        set_up(x_value, y_value)
      end
    end
  end 
end
distance = @distnace

image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1],
])

puts "Image Blur 3 Starting Image"
image.output_image
puts " "
puts "Image Blur 3 Image"
puts "What is the desired distance?"
puts "(Challange Value = 3)"
image.blur(distance)
image.output_image
