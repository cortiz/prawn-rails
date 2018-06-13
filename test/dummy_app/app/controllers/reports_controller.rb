class ReportsController < ApplicationController
  
  def sample
    @items = [
      {name: "Hello"},
      {name: "World"},
    ]
  end

  def table
    @items = [
      [1,2,3],
      [4,5,6],
      [7,8,9],
    ]
  end
 
end
