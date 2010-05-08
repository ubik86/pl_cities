class City < ActiveRecord::Base
  validates_presence_of :community_id, :message => 'Nie wprowadzono gminy.'
  validates_presence_of :name,         :message => 'Nie wprowadzono nazwy miasta.'

  def region
    Region.find(:first, :conditions => ['code = ?',self.region_id])
  end
  
  def community
    Community.find(:first, :conditions => ['code = ?',self.community_id])
  end
  
  def county
    County.find(:first, :conditions => ['code = ?',self.county_id])
  end
end
