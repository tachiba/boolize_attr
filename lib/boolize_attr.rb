require "boolize_attr/version"

module BoolizeAttr
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def boolize_attr_reader(*args)
      args.each do |attr|
        remove_method attr if defined?(attr)

        define_method attr do
          value = if instance_variable_defined?(:"@#{attr}")
            instance_variable_get(:"@#{attr}")
          end

          return false if value.nil?
          return value if value.is_a?(TrueClass) || value.is_a?(FalseClass)

          value && value.is_a?(String) && value.to_i == 1
        end
      end
    end

    def boolize_attr_accessor(*args)
      attr_accessor(*args)
      boolize_attr_reader(*args)
    end

    def boolize_attr_writer(*args)
      attr_writer(*args)
    end
  end
end
