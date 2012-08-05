[:create, :update, :delete].each do |action|
  require "focused_imperator/rest/#{action}_command_action"
end