require 'rails_admin/config/fields/base'

module RailsAdmin
  module Config
    module Fields
      module Types
        class String < RailsAdmin::Config::Fields::Base
          RailsAdmin::Config::Fields::Types.register(self)

          register_instance_option :html_attributes do
            {
              maxlength: length,
              size: [50, length.to_i].min,
            }
          end

          def generic_help
            text = (required? ? I18n.translate('admin.form.required') : I18n.translate('admin.form.optional')) + '. '
            text
          end

          register_instance_option :partial do
            :form_field
          end
        end
      end
    end
  end
end
