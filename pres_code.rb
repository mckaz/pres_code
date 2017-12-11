


class Examples


  type '(Integer x {{ 0 <= x && x < 60 }}) -> Integer ret {{ 0 <= ret && ret < 60 }}'
  def increment_sec(x)
    if (x == 59) then 0 else x+1 end
  end



end
