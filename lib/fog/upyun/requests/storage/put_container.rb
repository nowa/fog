module Fog
  module Storage
    class UpYun
      class Real

        # Create a new container
        #
        # ==== Parameters
        # * bucket_name<~String> - Name for bucket
        # * name<~String> - Name for container, should be < 256 bytes and must not contain '/'
        #
        def put_container(bucket_name, name)
          request(
            :expects  => 200,
            :headers  => headers,
            :method   => 'PUT',
            :path     => "#{bucket_name}/#{CGI.escape(name)}"
          )
        end

      end
    end
  end
end
