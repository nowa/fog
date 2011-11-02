module Fog
  module Storage
    class UpYun
      class Real

        # Delete an existing container
        #
        # ==== Parameters
        # * bucket_name<~String> - Name for bucket
        # * name<~String> - Name of container to delete
        #
        def delete_container(bucket_name, name)
          request(
            :expects  => 200,
            :method   => 'DELETE',
            :path     => "#{bucket_name}/#{CGI.escape(name)}"
          )
        end

      end
    end
  end
end
