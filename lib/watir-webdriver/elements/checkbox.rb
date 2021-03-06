module Watir
  class CheckBox < Input

    #
    # Sets checkbox to the given value.
    #
    # @example
    #   checkbox.set?        #=> false
    #   checkbox.set
    #   checkbox.set?        #=> true
    #   checkbox.set(false)
    #   checkbox.set?        #=> false
    #
    # @param [Boolean] bool
    #

    def set(bool = true)
      set? == bool ? assert_enabled : click
    end

    #
    # Returns true if the element is checked
    # @return [Boolean]
    #

    def set?
      assert_exists
      element_call { @element.selected? }
    end

    #
    # Unsets checkbox.
    #

    def clear
      set false
    end

  end # CheckBox

  module Container
    def checkbox(*args)
      CheckBox.new(self, extract_selector(args).merge(tag_name: "input", type: "checkbox"))
    end

    def checkboxes(*args)
      CheckBoxCollection.new(self, extract_selector(args).merge(tag_name: "input", type: "checkbox"))
    end
  end # Container

  class CheckBoxCollection < InputCollection
    def element_class
      CheckBox
    end
  end # CheckBoxCollection
end # Watir
