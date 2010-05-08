class PlCitiesGenerator < Rails::Generator::NamedBase
  attr_accessor :pl_cities_table_name
  def initialize(runtime_args, runtime_options = {})
    self.pl_cities_table_name = %w[:cities :communities :counties :regions]
    
    runtime_args << 'create_pl_cities' if runtime_args.empty?
    super
  end

  def manifest
    record do |m|
      m.migration_template 'pl_cities_migration.rb', 'db/migrate'
      self.pl_cities_table_name.each do |file|
        file = file.gsub(':','')
        m.template "fixtures/#{file}.csv", "test/fixtures/#{file}.csv"
      end
    end
  end
end
