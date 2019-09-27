class Image
  attr_accessor :array

  def initialize(array)
    @array = array
  end

  def blur!(distance = 1)
    distance.times do
      transform
    end
  end

  def output_image
    @array.each {|item| puts "#{item.join()}"}
  end

  private

  def transform
  
    width = array[0].length

    height = array.length

    ones_array = []

    array.each_with_index do |row, y|
      row.each_with_index do |value, x|
        ones_array << [x, y] if value == 1
      end
    end

    ones_array.each do |coordinate|
      x, y = coordinate

      array[y][x + 1] = 1 unless (x + 1 >= width)
      array[y][x - 1] = 1 unless (x - 1 < 0)
      array[y + 1][x] = 1 unless (y + 1 >= height)
      array[y - 1][x] = 1 unless (y - 1 < 0)
    end
  end
end


image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0,],
  [0, 0, 0, 0, 0, 0, 0, 0,],
  [0, 0, 0, 1, 0, 0, 0, 0,],
  [0, 0, 0, 0, 0, 0, 0, 0,],
  [0, 0, 0, 0, 0, 0, 0, 0,],
  [0, 0, 0, 0, 0, 0, 0, 0,],
  [0, 0, 0, 0, 0, 0, 0, 0,],
  [0, 0, 0, 0, 0, 0, 0, 0,],
  [0, 0, 0, 0, 0, 0, 1, 0,],
  [0, 0, 0, 0, 0, 0, 0, 0,]
])

image.blur!(3)
image.output_image