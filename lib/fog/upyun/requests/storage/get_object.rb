module Fog
  module Storage
    class UpYun
      class Real

        # Get details for object
        #
        # ==== Parameters
        # * bucket_name<~String> - Name of bucket to look in
        # * object_name<~String> - Name of object to look for
        #
        def get_object(bucket_name, object_name, &block)
          request({
            :block    => block,
            :expects  => 200,
            :method   => 'GET',
            :path     => "#{bucket_name}/#{CGI.escape(object_name)}"
          }, false, &block)
        end

      end
    end
  end
end
