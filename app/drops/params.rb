module Storyblok
  class ParamsDrop < Liquid::Drop
    def initialize parameters
      @parameters = parameters
    end

    def liquid_method_missing(name)
      @parameters[name]
    end
  end
end
