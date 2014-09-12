require "active_record"

require "assorted/version"
require "assorted/scopes"

ActiveSupport.on_load(:active_record) do
  extend Assorted::Scopes
end
