
require 'rack/request'
require 'apartment/tenant'

module Apartment
  module Elevators
    class Generic
      def call(env)
        request = Rack::Request.new(env)
        database = @processor.call(request)
        if database
          Apartment::Tenant.switch(database) { @app.call(env) }
        else
          @app.call(env)
        end
      rescue Apartment::TenantNotFound => error
        Rails.logger.error "ERROR: Apartment Tenant or Schema not found: #{error}"
        @app.call(env)
      end
    end
  end
end
