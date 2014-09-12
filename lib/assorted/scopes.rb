module Assorted
  module Scopes
    def asc(column = sorting_column)
      sanitized_order(column, :asc)
    end

    def desc(column = sorting_column)
      sanitized_order(column, :desc)
    end

    def sorting_column
      @sorting_column ||= :created_at
    end

    def sorting_column=(column)
      @sorting_column = column
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
