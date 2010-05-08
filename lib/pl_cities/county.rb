class County < ActiveRecord::Base

  has_many :communities
  has_many :cities, :through => :communities
  belongs_to :region

  def region
    Region.find(:first, :conditions => ["code = ?",self.region_id])
  end

  def communities
    Community.find(:all,:conditions => ["county_id = ? AND region_id = ?", self.code, self.region_id])
  end

  def cities
    City.find(:all,:conditions      => ["county_id = ? AND region_id = ?", self.code, self.region_id])
  end

end