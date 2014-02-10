class BaseCrawler

  attr_accessor :item


  def crawl( id )
    @item = crawl_class.find id
    raise 'Crawl target not found' unless @item.present?

    setup

    begin
      ActiveRecord::Base.transaction{ process }
    rescue Exception => e
      @item.fail_processing
      raise e
    end

    complete
  end


  #=============================================================================
    protected
  #=============================================================================


  def setup
    @item.begin_processing
    @item.save
  end


  def complete
    @item.complete_processing
    @item.save
  end


  def process
    raise 'Not implemented in BaseCrawler'
  end

end
