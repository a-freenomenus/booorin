class Image < ActiveRecord::Base
  belongs_to :user, :counter_cache => true
  
  validates_presence_of :url
  validate :valid_url?
  
  # @todo Add validation of url
private
  def valid_url?
    unless url && url =~ /(http|https):\/\/*/
      errors.add(:url, "is missing or invalid")
    end    
  end
end
