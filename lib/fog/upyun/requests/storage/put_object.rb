module Fog
  module Storage
    class UpYun
      class Real

        # Create a new object
        #
        # ==== Parameters
        # * bucket_name<~String> - Name for bucket
        # * object_name<~String> - Name for object
        # * data<~String|File> - data to upload
        # * options<~Hash> - config headers for object. Defaults to {}.
        #
        def put_object(bucket_name, object_name, data, options = {})
          data = Fog::Storage.parse_data(data)
          headers = data[:headers].merge!(options)
          request(
            :body     => data[:body],
            :expects  => 200,
            :headers  => headers,
            :method   => 'PUT',
            :path     => "#{bucket_name}/#{CGI.escape(object_name)}"
          )
        end

      end
    end
  end
end
