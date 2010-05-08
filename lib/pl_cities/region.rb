class Region < ActiveRecord::Base

  has_many :counties
  has_many :communities, :through => :counties

  validates_presence_of   :name, :message => 'Nie wprowadzono nazwy województwa.'
  validates_uniqueness_of :name, :message => 'Województwo jest już w systemie.'

  def counties
    County.find(:all, :conditions    => ['region_id = ?', self.code])
  end

  def communities
    Community.find(:all, :conditions => ['region_id = ?', self.code])
  end

  def cities
    City.find(:all, :conditions      => ['region_id = ?', self.code])
  end

  def accounting_offices_cities
    City.find(:all, :conditions      => ['region_id = ?', self.code], :joins => :accounting_offices).uniq.sort_by{|city|  city.name }
  end

end
