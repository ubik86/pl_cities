class <%= class_name %> < ActiveRecord::Migration
  def self.up
    create_table( <%= pl_cities_table_name[0] %>, :options => 'collate utf8_polish_ci' ) do |t|
      t.integer :region_id
      t.integer :county_id
      t.integer :community_id
      t.string  :name

      t.timestamps
    end
    
    create_table( <%= pl_cities_table_name[1] %>, :options => 'collate utf8_polish_ci' ) do |t|
      t.integer :region_id
      t.integer :county_id
      t.integer :code
      t.integer :community_type
      t.string  :name
      t.string  :name_ext

      t.timestamps
    end
    
    create_table( <%= pl_cities_table_name[2] %>, :options => 'collate utf8_polish_ci' ) do |t|
      t.integer :region_id
      t.integer :code
      t.string  :name
      t.string  :name_ext
      
      t.timestamps
    end
    
    create_table( <%= pl_cities_table_name[3] %>, :options => 'collate utf8_polish_ci' ) do |t|
      t.integer :country_id
      t.integer :code
      t.string  :name
      t.string  :name_ext

      t.timestamps
    end
    
    add_index :regions, :country_id
    add_index :regions, :code
    add_index :regions, :name
    
    add_index :counties, :region_id
    add_index :counties, :code
    add_index :counties, :name
    
    add_index :communities, :region_id
    add_index :communities, :county_id
    add_index :communities, :code
    add_index :communities, :name
    add_index :communities, :community_type
    
    add_index :cities, :region_id
    add_index :cities, :county_id
    add_index :cities, :name
    add_index :cities, :community_id
  end

  def self.down
    drop_table <%= pl_cities_table_name.join(', ') %>
  end
  
end