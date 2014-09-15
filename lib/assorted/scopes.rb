module Assorted
  module Scopes
    def asc(column = sorting_column)
      sanitized_order(column, :asc)
    end

    def desc(column = sorting_column)
      sanitized_order(column, :desc)
    end

    def assorted(options)
      assorted_options.merge!(options)
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
      assorted_options[:default_sort_column] || Assorted.options[:default_sort_column]
    end

    def assorted_options
      @assorted_options ||= {}
    end

  end
end
