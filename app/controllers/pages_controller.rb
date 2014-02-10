class PagesController < InheritedResources::Base

  def home
    @domain = Domain.new
  end


  def show
  end

end
