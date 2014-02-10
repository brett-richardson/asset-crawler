class CrawlWorker

  include Sidekiq::Worker
  # sidekiq_options retry: false


  def perform( klass, id )
    "#{klass}Crawler".constantize.new.crawl id
  end

end
