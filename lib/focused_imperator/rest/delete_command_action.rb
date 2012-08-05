require 'focused_imperator/command_action'

class FocusedImperator::DeleteCommandAction < CommandAction
  protected

  delegate :invalid_path, :to => :index_path

  def index_path
    "#{resource_class_name.pluralize}_path"
  end
end

# create convenience constant
DeleteCommandAction = FocusedImperator::DeleteCommandAction