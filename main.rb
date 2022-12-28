module MMFinal 
    $HiddenCode = ["0", "0", "0", "0"]
    $GuessCode = ["0", "0", "0", "0"]
    $turns = -1
    $HiddenCode2 = ["0","0", "0", "0"]
    $GuessCode2 = ["0","0", "0", "0"]
    $Feedback = ["0", "0", "0", "0"]
    $Black = 0
    $White = 0
    
    
    class Game
        def initialize ()
           
        end
      
    end 

    class ComputerRandom 
        
        def initialize()
            generaterandom()
        end 

        def generaterandom 
            for i in 0..3 do 
                $HiddenCode[i] = rand(1..6).to_s
                print $HiddenCode[i]
            end 
            puts " "
        end 
    end 


    class Feedback
        def initialize
            givefeedback()
        end 

        def givefeedback

            $HiddenCode2 = $HiddenCode
            $GuessCode2 = $GuessCode
            puts "Giving Feedback: "
            for i in 0..3 do 
                if $HiddenCode2[i] == $GuessCode2[i]
                    $White = $White + 1 
                    $HiddenCode2[i] = -1
                    $GuessCode2[i] = 0
                end
            end 
            for j in 0..3 do 
                for k in 0..3 do 
                    if $HiddenCode2[j] == $GuessCode2[k]
                        $Black = $Black + 1
                        $HiddenCode2[j] = -1
                        $GuessCode2[k] = 0
                    end 
                end 
            end 
            if $turns > -1
                puts "Number of turns: " + $turns.to_s
                puts "Number of White: " + $White.to_s
                puts "Number of Black: " + $Black.to_s
            end 
            $turns = $turns + 1 
            if $White < 4
                HumanGuess1.chooseguess()
            end 
        end 
    end

    class HumanGuess
        def initialize()
            chooseguess()
        end
        def chooseguess()
            if $turns > -1
                puts "What is your guess? Enter without spacing (Eg: 2134): "
                guess = gets
                $GuessCode = guess.split(//)
                if $turns < 12 && $GuessCode != $HiddenCode
                    puts"XYZ"
                    Feedback1.givefeedback()
                elsif $GuessCode == $HiddenCode
                    puts "You have guessed the hidden code in " + $turns.to_s + " turns!"
                end 
            end 
        end 
    end 


end 


CompRan1 = MMFinal::ComputerRandom.new()
HumanGuess1 = MMFinal::HumanGuess.new()
Feedback1 = MMFinal::Feedback.new()


Game1 = MMFinal::Game.new()


