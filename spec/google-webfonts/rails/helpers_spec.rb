require 'spec_helper'

describe GoogleWebfonts::Rails::Helpers do
  def self.helper_method(*methods)
    # Pseudo method
  end

  include GoogleWebfonts::Rails::Helpers

  describe "#google_webfonts_init" do
    context "with no arguments" do
      it "should output script without WebFontConfig" do
        google_webfonts_init.should_not =~ /WebFontConfig/
      end
    end

    context "with google webfonts" do
      it "should output with Google WebFonts entry" do
        google_webfonts_init({
          google: ['Nunito', 'Oxygen']
        }).should include <<-JAVASCRIPT
  WebFontConfig = {
    google: {
      families: ['Nunito','Oxygen']
    }
  };
        JAVASCRIPT
      end
    end

    context "with adobe typekit" do
      it "should output with Adobe Typekit entry" do
        google_webfonts_init({
          typekit: 'adobe'
        }).should include <<-JAVASCRIPT
  WebFontConfig = {
    typekit: {
      id: 'adobe'
    }
  };
        JAVASCRIPT
      end
    end

    context "with ascender" do
      it "should output with Ascender entry" do
        google_webfonts_init({
          ascender: {testkey: ["AscenderSan:bold", "Calibri"]}
        }).should include <<-JAVASCRIPT
  WebFontConfig = {
    ascender: {
      key: 'testkey',
      families: ['AscenderSan:bold','Calibri']
    }
  };
        JAVASCRIPT
      end
    end

    context "with monotype(fonts.com)" do
      it "should output with Monotype entry" do
        google_webfonts_init({
          monotype: "test"
        }).should include <<-JAVASCRIPT
  WebFontConfig = {
    monotype: {
      projectId: 'test'
    }
  };
        JAVASCRIPT
      end
    end

    context "with fontdeck" do
      it "should output with Fontdeck entry" do
        google_webfonts_init({
          fontdeck: "xxxxx"
        }).should include <<-JAVASCRIPT
  WebFontConfig = {
    fontdeck: {
      id: 'xxxxx'
    }
  };
        JAVASCRIPT
      end
    end

    context "with custom" do
      it "should output with pseudo font provider" do
        google_webfonts_init({
          custom: {
            'OneFont' => 'http://example.com/stylesheet1.css',
            'AnotherFont' => 'http://example.com/stylesheet2.css'
          }
        }).should include <<-JAVASCRIPT
  WebFontConfig = {
    custom: {
      families: ['OneFont','AnotherFont'],
      urls: ['http://example.com/stylesheet1.css','http://example.com/stylesheet2.css']
    }
  };
        JAVASCRIPT
      end
    end

    context "with multiple font provider" do
      it "should output with Google Webfonts and Monotype entries" do
        google_webfonts_init({
          google: ['Nunito', 'Oxygen'],
          monotype: "test"
        }).should include <<-JAVASCRIPT
  WebFontConfig = {
    google: {
      families: ['Nunito','Oxygen']
    },
    monotype: {
      projectId: 'test'
    }
  };
        JAVASCRIPT
      end
    end
  end
end