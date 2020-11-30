class FixerService < ApplicationService
  def base_url
    ENV.fetch('FIXER_API_URL')
  end

  def access_key
    ENV.fetch('FIXER_ACCESS_KEY')
  end

  def cache_service(key:)
    CacheService.new(key: key)
  end
end

