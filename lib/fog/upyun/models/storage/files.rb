require 'fog/core/collection'
require 'fog/upyun/models/storage/file'

module Fog
  module Storage
    class UpYun

      class Files < Fog::Collection

        attribute :directory

        model Fog::Storage::UpYun::File

        def get(key, options = {}, &block)
          requires :directory
          data = connection.get_object(directory.key, key, options, &block)
          file_data = data.headers.merge({
            :body => data.body,
            :key  => key
          })
          new(file_data)
        rescue Excon::Errors::NotFound
          nil
        end

        def get_url(key)
          requires :directory
          if self.directory.public_url
            "#{self.directory.public_url}/#{CGI.escape(key, '/')}"
          end
        end

        def new(attributes = {})
          requires :directory
          super({ :directory => directory }.merge!(attributes))
        end

      end

    end
  end
end
