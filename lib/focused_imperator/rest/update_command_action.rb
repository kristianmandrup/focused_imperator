require 'focused_imperator/command_action'

class FocusedImperator::UpdateCommandAction < CommandAction
  protected

  delegate :invalid_path, :to => :edit_path

  def edit_path
    "edit_#{resource_class_name}_path"
  end
end

# create convenience constant
UpdateCommandAction = FocusedImperator::UpdateCommandAction