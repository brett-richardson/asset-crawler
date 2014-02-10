class DomainCrawler < BaseCrawler

  def crawl_class ; Domain ; end


  def process
    PageCrawler.new.crawl find_or_create_root_page.id
  end


  #=============================================================================
    protected
  #=============================================================================


  def find_or_create_root_page
    Page.find_or_create_by domain_id: @item.id, path: '/'
  end


end
