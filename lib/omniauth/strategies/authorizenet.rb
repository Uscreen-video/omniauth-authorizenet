# frozen_string_literal: true

require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Authorizenet < OmniAuth::Strategies::OAuth2
      option :name, :authorizenet
      # TODO: check env to set the right site.
      option :client_options,
             site: 'https://accesstest.authorize.net/oauth/',
             authorize_url: '/oauth/authorize',
             token_url: '/oauth/v1/token'
      option :authorize_options, %i[scope]

      def raw_info
        @raw_info ||= access_token.get('/me').parsed
      end

      private

      def redirect_params
        if options.key?(:callback_path) && OmniAuth.config.full_host
          { redirect_uri: callback_url }
        else
          {}
        end
      end

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end
