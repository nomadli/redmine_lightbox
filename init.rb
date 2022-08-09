require 'redmine'

plugin_name = :redmine_lightbox
plugin_root = File.dirname(__FILE__)

unless defined?(SmileTools)
  require_dependency plugin_root + '/lib/redmine_lightbox/attachments_patch'
  require_dependency plugin_root + '/lib/redmine_lightbox/hooks/view_layouts_base_html_head_hook'
end


Redmine::Plugin.register :redmine_lightbox do
  name 'Redmine Lightbox'
  author 'nomadli'
  description 'This plugin lets you preview image and pdf attachments in a lightbox.'
  version '0.5.3'
  url 'https://github.com/nomadli/redmine_lightbox'
  author_url 'https://nomadli.github.io'
  requires_redmine :version_or_higher => '4.0'
end



# Patches to the Redmine core.
unless defined?(SmileTools)
  require 'dispatcher' unless Rails::VERSION::MAJOR >= 3

  if Rails::VERSION::MAJOR >= 5
    ActiveSupport::Reloader.to_prepare do
      require_dependency 'attachments_controller'
      AttachmentsController.send(:include, RedmineLightbox::AttachmentsPatch)
    end
  elsif Rails::VERSION::MAJOR >= 3
    ActionDispatch::Callbacks.to_prepare do
      require_dependency 'attachments_controller'
      AttachmentsController.send(:include, RedmineLightbox::AttachmentsPatch)
    end
  else
    Dispatcher.to_prepare do
      require_dependency 'attachments_controller'
      AttachmentsController.send(:include, RedmineLightbox::AttachmentsPatch)
    end
  end
end
