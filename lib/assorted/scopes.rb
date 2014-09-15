module Assorted
  module Scopes
    def asc(column = sorting_column)
      sanitized_order(column, :asc)
    end

    def desc(column = sorting_column)
      sanitized_order(column, :desc)
    end

    def set_sorting_column(column)
      self.sorting_column = column
    end

    private

    def sanitized_order(column, direction)
      if attribute_names.include?(column.to_s)
        order("#{table_name}.#{column} #{direction}")
      else
        raise ActiveRecord::StatementInvalid, "Unknown column #{column}"
      end
    end

    def sorting_column
      @sorting_column || Assorted.options[:sorting_column]
    end

    def sorting_column=(column)
      @sorting_column = column
    end

  end
end
