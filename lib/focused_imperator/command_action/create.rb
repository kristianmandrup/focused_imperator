require 'focused_imperator/command_action/base'

class FocusedImperator::CommandAction::Create < CommandAction
  protected

  delegate :invalid_path, :to => :new_path

  def new_path
    "new_#{resource_class_name}_path"
  end
end

# create convenience constant
CreateCommandAction = Imperator::Focused::CreateCommandAction