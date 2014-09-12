require "active_record"

require "sorted/version"
require "sorted/scopes"

ActiveSupport.on_load(:active_record) do
  include Sorted::Scopes
end
