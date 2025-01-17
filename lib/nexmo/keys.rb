# frozen_string_literal: true

module Nexmo
  module Keys
    def hyphenate(hash)
      hash.transform_keys { |k| k.to_s.tr('_', '-') }
    end

    def camelcase(hash)
      hash.transform_keys { |k| k.to_s.gsub(/_(\w)/) { $1.upcase } }
    end

    ATTRIBUTE_KEYS = Hash.new { |h, k| h[k] = k.split(PATTERN).join('_').downcase.to_sym }

    PATTERN = /[\-_]|(?<=\w)(?=[A-Z])/

    private_constant :ATTRIBUTE_KEYS

    private_constant :PATTERN

    def attribute_key(k)
      return k if k.is_a?(Symbol)

      ATTRIBUTE_KEYS[k]
    end
  end

  private_constant :Keys
end
