require File.expand_path(File.join(File.dirname(__FILE__), '..', 'upyun'))
require 'fog/storage'

module Fog
  module Storage
    class UpYun < Fog::Service
      requires :upyun_storage_username, :upyun_storage_userpass
      recognizes :host, :port, :scheme, :persistent
      
      model_path 'fog/upyun/models/storage'
      model       :directory
      model       :file
      collection  :files
      
      request_path 'fog/upyun/requests/storage'
      request :get_object
      request :put_object
      request :delete_object
      request :put_container
      request :delete_container
      request :get_objects
      request :get_bucket_usage
      
      class Mock
        def self.data
          @data ||= Hash.new do |hash, key|
            hash[key] = {}
          end
        end

        def self.reset
          @data = nil
        end

        def initialize(options={})
          require 'mime/types'
          @upyun_storage_username = options[:upyun_storage_username]
          @upyun_storage_userpass = options[:upyun_storage_userpass]
        end

        def data
          self.class.data[@upyun_storage_username]
        end

        def reset_data
          self.class.data.delete(@upyun_storage_username)
        end

      end
      
      class Real
        def initialize(options={})
          require 'mime/types'
          require 'multi_json'
          @upyun_storage_username = options[:upyun_storage_username]
          @upyun_storage_userpass = options[:upyun_storage_userpass]
          @connection_options     = options[:connection_options] || {}
          @hmac = Fog::HMAC.new('sha1', @google_storage_secret_access_key)
          @host = options[:host] || 'v0.api.upyun.com'
          @persistent = options[:persistent]  || true
          @port       = options[:port]        || 80
          @scheme     = options[:scheme]      || 'http'
          @connection = Fog::Connection.new("#{@scheme}://#{@host}:#{@port}", @persistent, @connection_options)
        end

        def reload
          @connection.reset
        end
        
        def request(params, &block)
          username_and_pass = "#{@upyun_storage_username}:#{@upyun_storage_userpass}"
          params[:headers]['Authorization'] = "Basic #{Base64.encode64(username_and_pass)}"

          response = @connection.request(params, &block)

          response
        end
      end
    end
  end
end