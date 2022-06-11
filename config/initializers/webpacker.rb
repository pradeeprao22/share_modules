Webpacker::Compiler.class_eval do
    def compile
      if stale?
        run_webpack.tap do |success|
          record_compilation_digest
        end
      else
        true
      end
    end
end