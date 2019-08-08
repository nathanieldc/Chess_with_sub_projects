
class Board

  def intialize
    @rows = rows_setup  # this is the board, rows combine to be a complete board
  end
  

  ## TODO: assign correct color to pieces 
  def rows_setup
    big_pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    pawns = [Pawn, Pawn, Pawn, Pawn, Pawn, Pawn, Pawn, Pawn]
    (Array.new(8) { Array.new(8, nil) }).map.with_index do |row, idx_1|
      color = (idx_1 < 3 ? :black : :white)
      if [0, 7].include?(idx)
        big_pieces.map.with_index do |piece, idx_2|
          piece.new(color, self, [idx_1, idx_2])
        end
      elsif [1, 6].include?(idx)
        pawns.map.with_index do |piece, idx_2|
          piece.new(color, self, [idx_1, idx_2])
        end
      end
    end
  end

  def [](pos)
    @rows[pos[0]][pos[1]]
  end

  def []=(pos, val)
    @rows[pos[0]][pos[1]] = val
  end

  def move_piece(color, start_pos, end_pos)
    piece = self[start_pos] #=> Rook.obj => Rook.pos = [end_pos]
    raise "invalid starting position" if piece.nil?
    raise "Invalid move" unless piece.vaild_moves.include?(end_pos) && valid_pos?(end_pos)
    raise "Cannot move onto your own piece" if @rows[end_pos].color == color
    piece.pos= end_pos
    self[start_pos]= nil
    self[end_pos]= piece
  end

  def valid_pos?(pos)
    pos[0].between?(0..7) && pos[1].between?(0..7)
  end

  #def add_piece(piece, pos) # taken care of in row_setup
  #
  #end

  def checkmate?(color)

  end

  def in_check?(color)

  end
end