require "active_record"

require "assorted/version"
require "assorted/scopes"

module Assorted
  def self.options
    @options ||= {
      default_sort_column: :created_at,
    }
  end
end

ActiveSupport.on_load(:active_record) do
  extend Assorted::Scopes
end
