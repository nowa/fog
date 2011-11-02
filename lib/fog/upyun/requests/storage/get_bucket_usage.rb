module Fog
  module Storage
    class UpYun
      class Real

        # Get usage of the bucket
        #
        # ==== Parameters
        # * bucket_name<~String> - Name for bucket
        #
        def get_bucket_usage(bucket_name)
          request(
            :expects  => 200,
            :headers  => headers,
            :method   => 'GET',
            :path     => "#{bucket_name}/?usage"
          )
        end

      end
    end
  end
end
