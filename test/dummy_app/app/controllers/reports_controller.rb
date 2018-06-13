class ReportsController < ApplicationController
  
  def sample
    @items = [{:name=> "Hello"},{:name=> "World"}]
  end
 
end
