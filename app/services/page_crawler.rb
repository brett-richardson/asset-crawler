require 'open-uri'


class PageCrawler < BaseCrawler

  def crawl_class ; Page ; end


  def process
    set_current_page_title
    fetch_and_save_pages
    fetch_and_save_links
    # fetch_and_save_assets
    # fetch_and_save_asset_links
  end


  #=============================================================================
    protected
  #=============================================================================


  #= Fetch Methods ===

  def fetch_and_save_links
    return @links if @links
    @links = only_save_valid fetch_and_save_pages.map do |p|
      Link.new domain: @item.domain, source: @item, target: p
    end
  end


  def fetch_and_save_pages
    return @pages if @pages
    @pages = only_save_valid unique_links.map do |l|
      Page.new domain: @item.domain, path: l.path
    end
  end


  #= Helper Methods ===

  def document
    @document ||= Nokogiri::HTML open @item.url
  end


  def set_current_page_title
    @item.title = document.css( 'head title' ).first.content
    @item.save
  end


  def unique_links
    document.css( 'a' ).to_a.uniq{|el| el['href'] }.map do |el|
      Link.new(
        path: el['href'], text: el.text,
        domain: @item.domain, source_id: @item.id
      )
    end.select &:valid?
  end


  def only_save_valid( items )
    valid   = items.select &:valid?
    invalid = items.select &:invalid?
    ActiveRecord::Base.transaction{ valid.each &:save! }

    klass = items.first.class.to_s.pluralize

    if invalid.length > 0
      Rails.logger.error "PageCrawler only saved #{valid.length}/#{invalid.length} new #{klass}."
    else
      Rails.logger.info "PageCrawler saved #{valid.length} new #{klass}."
    end

    valid
  end

end
