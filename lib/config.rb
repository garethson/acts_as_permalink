module Acts
  module Permalink
    class Config
      attr_reader :to, :from, :separator, :max_length, :scope, :allow_update, :allow_blank, :use_for_param

      def initialize(options={})
        @config = options.with_indifferent_access

        @to = @config[:to].try(:to_sym) || :permalink
        @from = @config[:from].try(:to_sym) || :title
        @separator = @config[:underscore] ? "_" : "-"
        @scope = @config[:scope].presence

        @max_length = @config[:max_length].to_i rescue 0
        @max_length = 60 unless @max_length > 0
        @allow_update = !!@config[:allow_update]
        @allow_blank = !!@config[:allow_blank]
        @use_for_param = @config[:use_for_param] == true ? true : false
      end
    end
  end
end
