Dir.glob(File.dirname(__FILE__) + "/lib/*.rb") do |f|
  require f
end