require "active_record"

require "assorted/version"
require "assorted/scopes"

ActiveSupport.on_load(:active_record) do
  include Assorted::Scopes
end
