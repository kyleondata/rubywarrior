class Player
@health
$direction = :backward
  def play_turn(warrior)
	# as a warrior I should only rest
	# if I am not taking damage. Thus
	# we can assume that if I the space
	# in front of me is not empty I am taking
	# damage. Also if my last turns health is greater
	# than the current turns health I am taking damage. 

	if atWall?(warrior)
		$direction = :forward	
	elsif !empty?(warrior)
		takeAction(warrior)
	else
		if !takingDamage(warrior) && warrior.health < 20
			warrior.rest!
		else
			if warrior.health > 15
				warrior.walk!($direction)
			elsif $direction == :forward
				warrior.walk!(:backward)
			end
		end	
	end
    	@health = warrior.health
  end

  def takingDamage(warrior)
	@health > warrior.health if !@health.nil?
  end

  def takeAction(warrior)
 	if warrior.feel($direction).captive?
		warrior.rescue!($direction)
	else
		warrior.attack!($direction)
	end
  end

  def empty?(warrior)
	warrior.feel($direction).empty?
  end

  def atWall?(warrior)
	warrior.feel($direction).to_s() == "wall"
  end
 
end

