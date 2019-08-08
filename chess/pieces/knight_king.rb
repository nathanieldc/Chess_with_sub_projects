class Knight < Piece
    def initialize(color, board, pos)
      super 
    end

    def symbol
      :k
    end

    protected 

    def move_diffs

    end
end

class King < Piece
    def initialize(color, board, pos)
      super
    end
    
    def symbol
      :K
    end

    protected 

    def move_diffs

    end
end

module Stepable
  def moves

  end

  private

  move_diffs
end