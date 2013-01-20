module GoogleWebfonts
  module Rails
    module Helpers
      extend ActiveSupport::Concern

      included do
        helper_method :google_webfonts_init
      end

      # Initialize WebFont Loader javascript. Put it in the head elements.
      #
      # @param config [Hash]
      # 
      #
      def google_webfonts_init(config = {})
        google_families = config.delete(:google)
        google_families = [google_families] unless google_families.is_a?(Array)

        print(google_families).html_safe
      end

      private

      def print(google)
        <<-JAVASCRIPT
<script type="text/javascript">
  WebFontConfig = {
    #{print_google(google)}
  };

  (function() {
    var wf = document.createElement('script');
    wf.src = ('https:' == document.location.protocol ? 'https' : 'http') +
      '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
    wf.type = 'text/javascript';
    wf.async = 'true';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(wf, s);
  })();
</script>
        JAVASCRIPT
      end

      def print_google(config)
        return "" if config.nil?

        families = config.map { |c| "'#{c}'" }.join(",")

        <<-JAVASCRIPT
    google: {
      families: [#{families}]
    },
        JAVASCRIPT
      end
    end
  end
end