require(File.expand_path(File.join(File.dirname(__FILE__), 'core')))

module Fog
  module UpYun
    extend Fog::Provider
    
    module Errors
      
    end
    
    service(:storage, 'upyun/storage', 'Storage')
  end
end