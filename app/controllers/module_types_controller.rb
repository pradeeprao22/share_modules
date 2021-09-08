class ModuleTypesController < ApplicationController
    def index
      @module_type = ModuleType.all
      render json: @module_type
    end
end
 