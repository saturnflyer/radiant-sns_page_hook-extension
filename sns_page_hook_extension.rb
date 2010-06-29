# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class SnsPageHookExtension < Radiant::Extension
  version "#{File.read(File.expand_path(File.dirname(__FILE__)) + '/VERSION')}"
  description "Allows you to use page radius tags in stylesheets and javascripts from the SNS extension."
  url "http://github.com/saturnflyer/radiant-sns_page_hook-extension"
  
  def activate
    TextAsset.class_eval {
      Page.included_modules.select{|m| m.to_s =~ /Tags$/}.reject{|m| m == Sns::PageTags }.each do |mod|
        include mod
      end
    }
    TextAssetContext.class_eval {
      def initialize(text_asset)
        super()
        globals.page = text_asset
        globals.text_asset = text_asset
        text_asset.tags.each do |name|
          define_tag(name) { |tag_binding| text_asset.render_tag(name, tag_binding) }
        end
      end
    }
  end
end
