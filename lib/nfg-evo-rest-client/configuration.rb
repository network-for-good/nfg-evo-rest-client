module NfgEvoRestClient
  module Configuration
    module ClassMethods
      @@nfg_evo_rest_base_url = nil
      @@nfg_evo_rest_user_email = nil
      @@nfg_evo_rest_user_token = nil

      def nfg_evo_rest_base_url(value = nil)
        if value.nil?
          if @nfg_evo_rest_base_url.nil?
            @@nfg_evo_rest_base_url
          else
            @nfg_evo_rest_base_url
          end
        else
          @nfg_evo_rest_base_url = value
        end
      end

      def nfg_evo_rest_base_url=(base_url)
        @@nfg_evo_rest_base_url = base_url
      end

      def nfg_evo_rest_user_email(value = nil)
        if value.nil?
          if @nfg_evo_rest_user_email.nil?
            @@nfg_evo_rest_user_email
          else
            @nfg_evo_rest_user_email
          end
        else
          @nfg_evo_rest_user_email = value
        end
      end

      def nfg_evo_rest_user_email=(user_email)
        @@nfg_evo_rest_user_email = user_email
      end

      def nfg_evo_rest_user_token(value = nil)
        if value.nil?
          if @nfg_evo_rest_user_token.nil?
            @@nfg_evo_rest_user_token
          else
            @nfg_evo_rest_user_token
          end
        else
          @nfg_evo_rest_user_token = value
        end
      end

      def nfg_evo_rest_user_token=(user_token)
        @@nfg_evo_rest_user_token = user_token
      end

    end

    def self.included(base)
      base.extend(ClassMethods)
    end
  end
end
