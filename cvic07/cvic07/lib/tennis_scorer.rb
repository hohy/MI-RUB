class TennisScorer  
  def initialize()
    @score = {
      server: 0,
      reciever: 0
    }
  end
  
  def score()
    "#{@score[:server]}-#{@score[:reciever]}"
  end   
  
  def win(who)
    if @score[who] < 30 then @score[who] += 15 
    elsif @score[who] < 45 then @score[who] += 10;
    end
  end
end