class CacheService < ApplicationService
  attr_reader :value

  def initialize(key:)
    # puts "Cache initialized!"
    @key = key
  end

  def call
    # puts "Cache call method!"
    @value = fetch
  end

  def fetch
    # puts "Cache fetch method!"
    # fetch response from cache store using @key
    # return response or nil if not found
  end

  def store(value:)
    # puts "Cache store method!"
    # save value to cache store using @key
  end

  def hit?
    # puts "Cache hit? method!"
    # return true if @value has value
    # else return false
    false
  end


end