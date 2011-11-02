require 'fog/core/collection'
require 'fog/upyun/models/storage/directory'

module Fog
  module Storage
    class UpYun

      class Directories < Fog::Collection

        model Fog::Storage::UpYun::Directory

      end

    end
  end
end
