module Assorted
  module Scopes
    def asc(column = :created_at)
      sanitized_order(column, :asc)
    end

    def desc(column = :created_at)
      sanitized_order(column, :desc)
    end

    private

    def sanitized_order(column, direction)
      if attribute_names.include?(column.to_s)
        order("#{column} #{direction}")
      else
        raise ActiveRecord::StatementInvalid, "Unknown column #{column}"
      end
    end
  end
end
