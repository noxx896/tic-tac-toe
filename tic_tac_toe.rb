require "matrix"
class Player
    @@players = 1
    attr_reader :name
    attr_reader :score
    attr_writer :score
    @score = 0

    def initialize(name = "Player_#{@@players}")
        @name = name
        @@players += 1
    end
    
end

class Board
    attr_reader :position
    attr_reader :rounds
    attr_reader :select_player
    
    def initialize(player_1, player_2)
        @player_1 = player_1
        @player_2 = player_2
        @board = Matrix[[1, 2, 3], [4, 5, 6], [7, 8, 9]]
        @select_player = true
        @rounds = 0
        @position = 0

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

    def play
        show_board
        until @player_1.score == 1 || @player_2.score == 1
            
            if @select_player
                puts "Player 1 chose a position:"
                @position = gets.chomp
    
            else
                puts "Player 2 chose a position:"
                @position = gets.chomp
            
            end
            aux = @board.index(@position.to_i)
            if select_player
                @board[aux[0], aux[1]] = "X"
                @select_player = false
                @rounds += 1
                show_board
                if @rounds > 4
                    check("X", @player_1)
                end

            else
                @board[aux[0], aux[1]] = "O"
                @select_player = true
                @rounds += 1
                show_board
                if @rounds > 4
                    check("O", @player_2)
                end

            end
            
            
        end
        
    end

    def check(mark, player)
        aux = []
        @board.map.with_index { |x, i|
            if x == mark
                aux << i 
            end
        }
        #possible solutions to win
        if (aux & [0, 1, 2]).size > 2 || (aux & [3, 4, 5]).size > 2 ||
            (aux & [6, 7, 8]).size > 2 || (aux & [0, 3, 6]).size > 2 ||
            (aux & [1, 4, 7]).size > 2 || (aux & [2, 5, 8]).size > 2 ||
            (aux & [0, 4, 8]).size > 2 || (aux & [2, 4, 6]).size > 2
           
            player.score = 1
            return puts "\n#{player.name} wins !!"
        end


    end

end

player_1 = Player.new
player_2 = Player.new

game = Board.new(player_1, player_2)

game.play

