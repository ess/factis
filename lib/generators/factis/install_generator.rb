module Factis
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)

      desc "Installs the Cucumber step and support files for Factis"
      
      def copy_steps
        template "factis_steps.rb", "features/step_definitions/factis_steps.rb"
      end

      def copy_support
        template "factis.rb", "features/support/factis.rb"
      end
    end
  end
end
