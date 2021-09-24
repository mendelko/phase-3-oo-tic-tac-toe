class TicTacToe

    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [2, 4, 6],
        [0, 4, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8]
    ]

    def initialize 
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken?(index)
        if @board[index] == "X" || @board[index] == "O"
            true
        else 
            false
        end
    end

    def valid_move?(index)
        if @board[index] == " " && index.between?(0,8)
            true
        else 
            false
        end
    end

    def turn_count
        moves = 0
        @board.each do |move|
            if move == "X" || move == "O"
                moves += 1
            end
        end
        moves
    end

    def current_player
        if turn_count % 2 == 0
            "X"
        else
            "O"
        end
    end

    def turn
        puts "Please choose a position between 1-9"
        input = gets.chomp
        index = input_to_index(input)
        if valid_move?(index)
            token = current_player
            move(index, token)
            display_board
        else
            turn
        end
    end

    def won?
        WIN_COMBINATIONS.detect do |win|
            if @board[win[0]] == "X" && @board[win[1]] == "X" && @board[win[2]] == "X"
                return win
            elsif @board[win[0]] == "O" && @board[win[1]] == "O" && @board[win[2]] == "O"
                return win
            end
        end
        return false
    end

    def full?
         @board.all? do |move|
            move == "X" || move == "O"
         end
    end

    def draw?
        if full? && !won?
            return true
        else
           return false
        end
    end

    def over?
        if won? || draw?
            return true
        else
            return false
        end
    end

    def winner
        WIN_COMBINATIONS.each do |win|
            if @board[win[0]] == "X" && @board[win[1]] == "X" && @board[win[2]] == "X"
                return "X"
            elsif @board[win[0]] == "O" && @board[win[1]] == "O" && @board[win[2]] == "O"
                return "O"
            end
        end
        return nil
    end

    def play
        until over?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end
end