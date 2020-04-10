class Player
    @@players = 1
    def initialize(name = "Player #{@players}")
        @name = name
        @@players += 1
        @score = 0
    end
    
end

class Board
    
    def initialize(player_1, player_2, board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]])
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    public
    def show_board
        print "\n"
        print "\t   |   |   \n"
        print "\t #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]}\n"
        print "\t   |   |   \n"
        print "\t-----------\n"
        print "\t   |   |   \n"
        print "\t #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]}\n"
        print "\t   |   |   \n"
        print "\t-----------\n"
        print "\t   |   |   \n"
        print "\t #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]}\n"
        print "\t   |   |   \n"
        print "\n"
    end
    def play
        show_board
    end
end

player_1 = Player.new
player_2 = Player.new

play = Board.new(player_1, player_2)
play.play