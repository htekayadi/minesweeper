# app/services/board_service.rb

class BoardService

  attr_accessor :board

  MAX_K = 9
  MIN_K = 0

  def initialize(width, height, mines)
    @mines = mines
    @mines_placed = 0
    @k = MIN_K
    @width = width
    @height = height
    @cell_count = width * height
    array_2d = Array.new(width) { Array.new(height) { MIN_K } }
    @board = array_2d
  end

  def generate_board
    return if cell_count < mines

    while mines > mines_placed do
      coord = nil
      loop do
        coord = generate_coord
        break if available_position(coord)
      end
      place_mine(coord)
      @mines_placed += 1
      @k = mines_placed * MAX_K / cell_count
    end
  end

  def print_board
    (0...width).each do |i|
      (0...height).each do |j|
        value = board[i][j]
        print " #{value >= 10 ? value : " #{value}"} "
      end
      puts "\n"
    end
  end

  private

  attr_accessor :mines, :width, :height, :cell_count, :k, :mines_placed


  def available_position(coord)
    @board[coord.x][coord.y] <= k
  end

  def generate_coord
    x = rand(width)
    y = rand(height)
    Coord.new(x,y)
  end

  def place_mine(coord)
    @board[coord.x][coord.y] += MAX_K
    collateral_positions(coord).each do |c|
      position_existence = (board[c.x][c.y] rescue nil)
      next if position_existence.nil? || c.x < 0 || c.y < 0
      @board[c.x][c.y] += 1
    end
  end

  def collateral_positions(coord)
    [
      Coord.new(coord.x-1, coord.y-1),
      Coord.new(coord.x-1, coord.y),
      Coord.new(coord.x-1, coord.y+1),
      Coord.new(coord.x, coord.y-1),
      Coord.new(coord.x, coord.y+1),
      Coord.new(coord.x+1, coord.y-1),
      Coord.new(coord.x+1, coord.y),
      Coord.new(coord.x+1, coord.y+1),
    ]
  end
end

class Coord
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end
end
