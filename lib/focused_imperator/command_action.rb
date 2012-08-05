module FocusedImperator
  module CommandAction
  end
end

[:create, :update, :delete].each do |action|
  require "focused_imperator/_command_action/#{action}"
end

