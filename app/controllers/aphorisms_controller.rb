class AphorismsController < ApplicationController

  def index
     @author = Author.find(rand(0..Author.all.count-1))
     @aphorism = @author.aphorisms.first.aphorism

     #@author.aphorisms.find(rand(0..@author.aphorisms.count-1))
  end
end
