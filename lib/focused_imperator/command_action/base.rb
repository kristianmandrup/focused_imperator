class FocusedImperator::CommandAction::Base < ::FocusedAction
  def run
    command.valid? ? on_valid : on_invalid
  end

  def on_valid
    command.perform
    valid_redirect
  end

  def on_invalid
    invalid_render
  end

  class << self
    [:run, :action, :valid, :invalid, :valid_redirect_path, :invalid_path].each do |name|
      define_method name do |&block|
        send(:define_method, name, &block)
      end
    end
  end    

  protected

  def valid_redirect
    redirect_to valid_redirect_path
  end

  def invalid_render
    render send(invalid_path, command.object)
  end

  def invalid_path
    raise NotImplementedError, "Must be implemented by subclass"
  end

  def valid_redirect_path
    raise NotImplementedError, "Must be implemented by subclass"
  end

  def action
    self.class.name.underscore
  end

  def flash_msg msg, type = :notice
    flash[type.to_sym] = msg
  end

  def command
    @command ||= default_command
  end

  def default_command
    command_class.new object_hash
  end

  def object_hash
    send("#{resource_class_name}_hash")
  end

  def command_class
    @command_class ||= "#{action.to_s.camelize}#{resource_class_name}Command".constantize
  end
end

# create convenience constant
CommandAction = FocusedImperator::CommandAction::Base

require 'focused_imperator/command_action/resource_class'
