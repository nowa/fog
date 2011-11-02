require 'fog/core/model'
require 'fog/upyun/models/storage/files'

module Fog
  module Storage
    class UpYun

      class Directory < Fog::Model

        identity  :key, :aliases => 'name'

        def files
          @files ||= begin
            Fog::Storage::UpYun::Files.new(
              :directory    => self,
              :connection   => connection
            )
          end
        end
        
        def public_url
          requires :key
          @public_url ||= begin
            nil
          end
        end

      end

    end
  end
end
