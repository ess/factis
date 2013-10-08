module Factis
  module Generators
    class RspecGenerator < Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)

      desc "Installs the Rspec support files for Factis"
      
      def copy_support
        template "spec/support/factis.rb",
          "spec/support/factis.rb"
      end
    end
  end
end
