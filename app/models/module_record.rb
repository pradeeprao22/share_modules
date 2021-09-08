class ModuleRecord < ApplicationRecord
    self.abstract_class = true
    
    connects_to database: {  writing: :module, reading: :module_replica }
end