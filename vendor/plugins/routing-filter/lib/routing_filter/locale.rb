require 'i18n'
require 'routing_filter/base'

module RoutingFilter
  class Locale < Base
    @@include_default_locale = true
    cattr_writer :include_default_locale

    class << self
      def include_default_locale?
        @@include_default_locale
      end

      def current_locale
        @@current_locale ||= RefinerySetting.find_or_set(:refinery_i18n_locale, :en)
      end

      def current_locale=(locale)
        @@current_locale = locale.to_sym
        RefinerySetting[:refinery_i18n_locale] = @@current_locale
      end

      def default_locales
        RefinerySetting.find_or_set(:refinery_i18n_locales, {:en => "English", :nl => "Nederlands"})
      end

      # returns an array like [:en, :nl, :fr]
      def locales
        @@locales ||= default_locales.collect{|l| l.first}.map(&:to_sym)
      end

      def locales=(locales)
        @@locales = locales.map(&:to_sym)
      end

      def locales_pattern
        @@locales_pattern ||= %r(^/(#{self.locales.map { |l| Regexp.escape(l.to_s) }.join('|')})(?=/|$))
      end
    end

    def around_recognize(path, env, &block)
      locale = extract_locale!(path)                 # remove the locale from the beginning of the path
      returning yield do |params|                    # invoke the given block (calls more filters and finally routing)
        if locale and ::RoutingFilter::Locale.i18n_enabled?
          # set recognized locale to the resulting params hash
          ::RoutingFilter::Locale.current_locale = params[:locale] = locale
        end
      end
    end

    def around_generate(*args, &block)
      if ::RoutingFilter::Locale.i18n_enabled?
        locale = args.extract_options!.delete(:locale) # extract the passed :locale option
        locale = I18n.locale if locale.nil?            # default to I18n.locale when locale is nil (could also be false)
        locale = nil unless valid_locale?(locale)      # reset to no locale when locale is not valid

        returning yield do |result|
          if locale && prepend_locale?(locale)
            url = result.is_a?(Array) ? result.first : result
            prepend_locale!(url, locale)
          end
        end
      else
        return yield
      end
    end

    protected

      def extract_locale!(path)
        path.sub! self.class.locales_pattern, ''
        $1
      end

      def prepend_locale?(locale)
        self.class.include_default_locale? || !default_locale?(locale)
      end

      def valid_locale?(locale)
        locale.present? && self.class.locales.include?(locale.to_sym)
      end

      def default_locale?(locale)
        locale && locale.to_sym == I18n.default_locale.to_sym
      end

      def prepend_locale!(url, locale)
        url.sub!(%r(^(http.?://[^/]*)?(.*))) { "#{$1}/#{locale}#{$2}" }
      end
  end
end