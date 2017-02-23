class AphorismsController < ApplicationController

  def index
     @author = Author.find(rand(0..Author.all.count-1))
     @aphorism = @author.aphorisms.find(rand(@author.aphorisms.first.id..@author.aphorisms.last.id)).aphorism
  end
end
