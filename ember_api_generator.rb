class EmberApiGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def create_controller_file
    template "controller.rb", "app/controllers/#{file_name.pluralize}_controller.rb"
  end

end
