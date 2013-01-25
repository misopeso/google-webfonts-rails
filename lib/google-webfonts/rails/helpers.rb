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
        renderer = GoogleWebfonts::ConfigRenderer.new

        renderer.google= config.delete(:google)
        renderer.typekit= config.delete(:typekit)
        renderer.ascender= config.delete(:ascender)
        renderer.monotype= config.delete(:monotype)
        renderer.fontdeck= config.delete(:fontdeck)
        renderer.custom= config.delete(:custom)

        specific_version = config.delete(:version) || "1"

        construct(renderer, specific_version).html_safe
      end

      private

      def construct(renderer, version)
        <<-JAVASCRIPT
<script type="text/javascript">
#{renderer.render}

  (function() {
    var wf = document.createElement('script');
    wf.src = ('https:' == document.location.protocol ? 'https' : 'http') +
      '#{loader_url(version)}';
    wf.type = 'text/javascript';
    wf.async = 'true';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(wf, s);
  })();
</script>
        JAVASCRIPT
      end

      def loader_url(version)
        "://ajax.googleapis.com/ajax/libs/webfont/#{version}/webfont.js"
      end
    end
  end
end