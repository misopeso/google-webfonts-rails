module GoogleWebfonts
  class ConfigRenderer
    def initialize
      @config = {}
    end

    def google= families
      return if families.nil?

      families = [families] unless families.is_a?(Array)
      return if families.empty?

      @config.merge!({
        google: {
          families: families
        }
      })
    end

    def typekit= id
      return if id.nil?

      @config.merge!({
        typekit: {
          id: id
        }
      })
    end

    def ascender= options
      return if options.nil?
      raise ArgumentError, "expected a Hash, got a #{options.class}" unless options.class == Hash
      return if options.empty?

      families = options.values.first
      families = [families] unless families.is_a?(Array)

      @config.merge!({
        ascender: {
          key: options.keys.first.to_s,
          families: families
        }
      })
    end

    def monotype= id
      return if id.nil?

      @config.merge!({
        monotype: {
          projectId: id
        }
      })
    end

    def fontdeck= id
      return if id.nil?

      @config.merge!({
        fontdeck: {
          id: id
        }
      })
    end

    def custom= options
      return if options.nil?
      raise ArgumentError, "expected a Hash, got a #{options.class}" unless options.class == Hash
      return if options.empty?

      families, urls = [], []

      options.each do |k, v|
        families << k.to_s
        urls << v
      end

      @config.merge!({
        custom: {
          families: families,
          urls: urls,
        }
      })
    end

    def render
      return "" if @config.empty?

      <<-JAVASCRIPT
  WebFontConfig = {
#{hash_to_js(@config, 2)}
  };
      JAVASCRIPT
    end

    private

    def hash_to_js(h, level)
      buffer = ""

      h.each do |k, v|
        buffer << ",\n" unless buffer.empty?
        buffer << "  " * level + "#{k}: "
        buffer << "'#{v}'" if v.is_a?(String)
        buffer << "[#{array_to_js(v)}]" if v.is_a?(Array)
        buffer << "{\n#{hash_to_js(v, level + 1)}\n" + "  " * level + "}" if v.is_a?(Hash)
      end

      buffer
    end

    def array_to_js(a)
      a.map { |e| "'#{e}'" }.join(",")
    end
  end
end
