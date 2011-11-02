module Fog
  module Storage
    class UpYun
      class Real

        # Get the container's files
        #
        # ==== Parameters
        # * bucket_name<~String> - Name for bucket
        # * name<~String> - Name for container, should be < 256 bytes and must not contain '/'
        #
        def get_objects(bucket_name, name)
          request(
            :expects  => 200,
            :headers  => headers,
            :method   => 'GET',
            :path     => "#{bucket_name}/#{CGI.escape(name)}"
          )
        end

      end
    end
  end
end
