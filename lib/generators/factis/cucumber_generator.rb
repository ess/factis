module Factis
  module Generators
    class CucumberGenerator < Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)

      desc "Installs the Cucumber step and support files for Factis"
      
      def copy_steps
        template "features/step_definitions/factis_steps.rb",
          "features/step_definitions/factis_steps.rb"
      end

      def copy_support
        template "features/support/factis.rb",
          "features/support/factis.rb"
      end
    end
  end
end
