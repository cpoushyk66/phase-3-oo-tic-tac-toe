class TicTacToe

    attr_accessor :board
    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    WIN_COMBINATIONS = [
        [0, 1, 2], #1 Top Rown
        [3, 4, 5], #2 Middle Row
        [6, 7, 8], #3 Bottom Row
        [0, 3, 6], #4 Left Column
        [1, 4, 7], #5 Middle Column
        [2, 5, 8], #6 Right Column
        [0, 4, 8], #7 Forward Diagonal
        [2, 4, 6] #8 Backward Diagonal
    ]

    def display_board
        puts "|#{self.board[0]}|#{self.board[1]}|#{self.board[2]}|"
        puts "|#{self.board[3]}|#{self.board[4]}|#{self.board[5]}|"
        puts "|#{self.board[6]}|#{self.board[7]}|#{self.board[8]}|"
    end

    def input_to_index
        gets.chomp.to_i - 1
    end

    def move(index, token = "X")
        if (valid_move(index))
            self.board[index] = token
        else
            nil
        end
    end

    def valid_move(index)
        index < self.board.length && !position_taken(index)
    end

    def position_taken?(index)
        self.board[index] != " "
    end

    def turn_count
        turn_c = 0
        self.board.each do |tile|
            if tile == " "
                turn_c += 1
            end
        end
        turn_c
    end

    def current_player
        turn_count%2 == 0 ? "X" : "O"
    end

    def turn
        puts "#{self.current_player}'s Turn:"
        puts "Please input game space:"
        turn_loop = nil
        while turn_loop == nil
           turn_loop = self.move(self.input_to_index, self.current_player)
        end 
        self.display_board

    end

    def won?
        did_win =WIN_COMBINATIONS.find |combo|
            self.board[combo[0]] == self.current_player && self.board[combo[1]] == self.current_player 
            && self.board[combo[2]] == self.current_player
        end

        did_win == nil ? nil : did_win
    end

    def full?
        count = 0
        self.board.each do |tile|
            if tile != " "
                count += 1
            end
        end
        count == self.board.length
    end

    def draw?
        self.full? && self.won? == nil
    end

    def over?
        self.full? || self.won?
    end

    def winner
        self.won? != nil ? self.current_player : nil
    end
    
end