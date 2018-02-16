require 'link'

describe Link do

  subject(:link) { described_class.new(1,'http://www.google.com', "Google") }
  describe "::all" do
    it "returns a list of all links" do
      links = Link.all
      urls = links.map(&:url)
      expect(urls).to include("http://www.google.com")
      expect(urls).to include("http://www.facebook.com")
    end
  end

  describe "::add_link" do
    it "adds a link to database" do
      described_class.add_link('http://www.runningoutofwebsites.com', 'Runningoutofwebsites')
      links = described_class.all
      urls = links.map(&:url)
      expect(urls).to include "http://www.runningoutofwebsites.com"
    end
    it "does not add an invalid link" do
      described_class.add_link('www.frog', 'Frog')
      expect(described_class.all).not_to include "www.frog"
    end
  end

  describe '#url' do
    it 'holds a url as an attribute' do
      expect(link.url).to eq 'http://www.google.com'
    end
  end
end
