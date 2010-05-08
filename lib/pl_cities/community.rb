class Community < ActiveRecord::Base

  def cities
    City.find(:all,:conditions => ["community_id = ? AND county_id = ? AND region_id = ?", self.code, self.county_id, self.region_id])
  end

  def county
    County.find(:first,:conditions => ["region_id = ? AND code = ?", self.region_id, self.county_id])
  end

  def region
    Region.find(:first, :conditions => ["code = ?",self.region_id])
  end
end