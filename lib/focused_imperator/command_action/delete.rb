require 'focused_imperator/command_action/base'

class FocusedImperator::CommandAction::Delete < CommandAction
  protected

  delegate :invalid_path, :to => :index_path

  def index_path
    "#{resource_class_name.pluralize}_path"
  end
end

# create convenience constant
DeleteCommandAction = FocusedImperator::CommandAction::Delete