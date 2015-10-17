module HereApi
  class Base

    class << self
      def auth_params
        { app_id: Rails.application.secrets.here_api_id, app_code: Rails.application.secrets.here_api_code }
      end
    end

  end
end