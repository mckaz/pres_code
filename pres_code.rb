


class Examples


  type '(Integer x {{ 0 <= x && x < 60 }}) -> Integer ret {{ 0 <= ret && ret < 60 }}'
  def increment_sec(x)
    if (x == 59) then 0 else x+1 end
  end



  def set_time(s, m, h)
    @sec = s
    @min = m
    @hour = h
  end


  type "(Integer, Integer) -> Integer"
  def plus(x, y)
    x + y
  end


  type '(A) -> Integer'
  def foo(x)
    x.m(42)
  end

  RDL.do_verify(:method)


end



module Arithmetic

  type '(Integer x) -> Float r {{ r==x/value() }}'
  def div_by_val(x) x/value(); end

  type :value, '() -> Float val {{ val > 0 }}', pure: true
       
end


class Money
  include Arithmetic 

  def value() if (@val>0) then (return @val) else (return 0.01) end

end




class UserFile < ActiveRecord::Base
  belongs_to :folder


  type '(Folder target) -> %bool b {{ folder == target }}'
  def move(taget) folder=target; save!; end


  type :folder, '() -> Folder', pure: true
  type :folder=, '(Folder in) -> Folder out {{ folder == in }}'

end




