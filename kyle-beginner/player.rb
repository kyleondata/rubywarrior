class Player
  @health

  def play_turn(warrior)
    # add your code here
    puts "health is #{@health.to_s()} | #{warrior.health}"
    takenDamage = @health.to_i() > warrior.health
  	if warrior.feel.empty?
      
      if takenDamage
        warrior.rest!
      else
	      warrior.walk!
      end
		else
	    warrior.attack!
	  end

    @health = warrior.health
   
  end
end
