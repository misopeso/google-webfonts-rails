require 'spec_helper'

describe GoogleWebfonts::ConfigRenderer do
  before do
    @render = GoogleWebfonts::ConfigRenderer.new
  end

  context "with google webfonts settings" do
    it "should process a argument" do
      @render.google = 'Nunito'

      h = @render.instance_variable_get(:@config)
      h.should have_key(:google)
      h[:google].should have_key(:families)
      h[:google][:families].should be_is_a(Array)
      h[:google][:families].should include('Nunito')
      h[:google][:families].should have(1).items
    end

    it "should process an array arguments" do
      @render.google = ['Nunito', 'Oxygen']

      h = @render.instance_variable_get(:@config)
      h.should have_key(:google)
      h[:google].should have_key(:families)
      h[:google][:families].should be_is_a(Array)
      h[:google][:families].should include('Nunito')
      h[:google][:families].should include('Oxygen')
      h[:google][:families].should have(2).items
    end

    it "should ignore nil without error" do
      @render.google = nil

      h = @render.instance_variable_get(:@config)
      h.should be_empty
    end

    it "should ignore empty array without error" do
      @render.google = []

      h = @render.instance_variable_get(:@config)
      h.should be_empty
    end
  end

  context "with adobe typekit settings" do
    it "should process id string" do
      @render.typekit = 'a12345'

      h = @render.instance_variable_get(:@config)
      h.should have_key(:typekit)
      h[:typekit].should have_key(:id)
      h[:typekit][:id].should == 'a12345'
    end
  end

  context "with ascender settings" do
    it "should process key and one family" do
      @render.ascender = {testAscenderKey: 'AscenderSan:bold'}

      h = @render.instance_variable_get(:@config)
      h.should have_key(:ascender)
      h[:ascender].should have_key(:key)
      h[:ascender][:key].should == 'testAscenderKey'
      h[:ascender].should have_key(:families)
      h[:ascender][:families].should be_is_a(Array)
      h[:ascender][:families].should include('AscenderSan:bold')
      h[:ascender][:families].should have(1).items
    end

    it "should process key and multi families" do
      @render.ascender = {testAscenderKey: ['AscenderSan:bold', 'Calibri']}

      h = @render.instance_variable_get(:@config)
      h.should have_key(:ascender)
      h[:ascender].should have_key(:key)
      h[:ascender][:key].should == 'testAscenderKey'
      h[:ascender].should have_key(:families)
      h[:ascender][:families].should be_is_a(Array)
      h[:ascender][:families].should include('AscenderSan:bold')
      h[:ascender][:families].should include('Calibri')
      h[:ascender][:families].should have(2).items
    end
  end

  context "with monotype(fonts.com) settings" do
    it "should process project id" do
      @render.monotype = 'testProjectId'

      h = @render.instance_variable_get(:@config)
      h.should have_key(:monotype)
      h[:monotype].should have_key(:projectId)
      h[:monotype][:projectId].should == 'testProjectId'
    end
  end

  context "with fontdeck settings" do
    it "should process id string" do
      @render.fontdeck = 'xxxxx'

      h = @render.instance_variable_get(:@config)
      h.should have_key(:fontdeck)
      h[:fontdeck].should have_key(:id)
      h[:fontdeck][:id].should == 'xxxxx'
    end
  end

  context "with custom settings" do
    it "should process one entry" do
      @render.custom = {'OneFont' => 'http://example.com/stylesheet1.css'}

      h = @render.instance_variable_get(:@config)
      h.should have_key(:custom)
      h[:custom].should have_key(:families)
      h[:custom][:families].should be_is_a(Array)
      h[:custom][:families].should have(1).items
      h[:custom][:families].should include('OneFont')
      h[:custom].should have_key(:urls)
      h[:custom][:urls].should be_is_a(Array)
      h[:custom][:urls].should include('http://example.com/stylesheet1.css')
    end

    it "should process multi entries" do
      @render.custom = {
        'OneFont' => 'http://example.com/stylesheet1.css',
        'AnotherFont' => 'http://example.com/stylesheet2.css'
      }

      h = @render.instance_variable_get(:@config)
      h.should have_key(:custom)
      h[:custom].should have_key(:families)
      h[:custom][:families].should be_is_a(Array)
      h[:custom][:families].should include('OneFont')
      h[:custom][:families].should include('AnotherFont')
      h[:custom][:families].should have(2).items
      h[:custom].should have_key(:urls)
      h[:custom][:urls].should be_is_a(Array)
      h[:custom][:urls].should include('http://example.com/stylesheet1.css')
      h[:custom][:urls].should include('http://example.com/stylesheet2.css')
      h[:custom][:urls].should have(2).items
    end
  end
end