class Link < ActiveRecord::Base

  #= Relationships ===
  belongs_to :domain
  belongs_to :source, class_name: 'Page'
  belongs_to :target, class_name: 'Page'

  #= Validations ===
  validates_presence_of :domain
  validates_presence_of :source
  validates_format_of :path, with: Path::FORMAT,
    message: 'link path not formatted correctly'

  #= Callbacks ===
  after_save :queue_crawler, if: :queue_crawler?

  #=============================================================================
    protected
  #=============================================================================

  #= Queued jobs ===

  def queue_crawler?
    new_record?
  end


  def queue_crawler
    CrawlWorker.perform_async 'Page', id
  end

end
