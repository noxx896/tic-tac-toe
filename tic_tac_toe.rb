require "matrix"
class Player
    @@players = 1
    attr_reader :name
    @score = 0

    def initialize(name = "Player_#{@players}")
        @name = name
        @@players += 1
    end
    
end

class Board
    attr_writer :position
    attr_reader :rounds
    attr_reader :select_player
    
    def initialize(player_1, player_2)
        @player_1 = player_1
        @player_2 = player_2
        @board = Matrix[[1, 2, 3], [4, 5, 6], [7, 8, 9]]
        @select_player = true
        @rounds = 0

    end

    public
    def show_board
        print "\n"
        print "\t   |   |   \n"
        print "\t #{@board[0, 0]} | #{@board[0, 1]} | #{@board[0, 2]}\n"
        print "\t   |   |   \n"
        print "\t-----------\n"
        print "\t   |   |   \n"
        print "\t #{@board[1, 0]} | #{@board[1, 1]} | #{@board[1, 2]}\n"
        print "\t   |   |   \n"
        print "\t-----------\n"
        print "\t   |   |   \n"
        print "\t #{@board[2, 0]} | #{@board[2, 1]} | #{@board[2, 2]}\n"
        print "\t   |   |   \n"
        print "\n"
    end

    def play(position)
        aux = @board.index(position)
        if select_player
            @board[aux[0], aux[1]] = "X"
            @select_player = false
        else
            @board[aux[0], aux[1]] = "O"
            @select_player = true
        end
        @rounds += 1
        show_board
    end

end

player_1 = Player.new
player_2 = Player.new

game = Board.new(player_1, player_2)

until game.rounds == 9
    if game.select_player
        puts "Player 1 chose a position:"
        position = gets.chomp
        game.play(position.to_i)
    else
        puts "Player 2 chose a position:"
        position = gets.chomp
        game.play(position.to_i)

    end
end

