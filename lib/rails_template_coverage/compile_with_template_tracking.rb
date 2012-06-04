module RailsTemplateCoverage
  def self.included(base)
   base.send :include, InstanceMethods
   base.send :alias_method_chain, :compile!, :template_tracking
  end

  module InstanceMethods
    def compile_with_template_tracking!(view)
      if !@compiled and File.file?(@identifier.to_s)
        # Set the access time for the template so we know it was rendered
        File.utime(Time.now, File.mtime(@identifier.to_s), @identifier.to_s)
      end
      compile_without_template_tracking!(view)
    end
  end
end
