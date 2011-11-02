module Fog
  module Storage
    class UpYun
      class Real

        # Delete an existing object
        #
        # ==== Parameters
        # * bucket_name<~String> - Name of bucket
        # * object_name<~String> - Name of object to delete
        #
        def delete_object(bucket_name, object_name)
          request(
            :expects  => 200,
            :method   => 'DELETE',
            :path     => "#{bucket_name}/#{CGI.escape(object_name)}"
          )
        end

      end
    end
  end
end
