require 'rails_admin/config'
require 'rails_admin/config/fields/base'
require 'rails_admin/config/fields/types/text'

module RailsAdmin
  module Config
    module Fields
      # Monkeypatch for adding to_sentence words_connectors
      class Association < RailsAdmin::Config::Fields::Base

        register_instance_option :pretty_value do
          v = bindings[:view]
          [value].flatten.select(&:present?).collect do |associated|
            amc = polymorphic? ? RailsAdmin.config(associated) : associated_model_config # perf optimization for non-polymorphic associations
            am = amc.abstract_model
            wording = associated.send(amc.object_label_method)
            can_see = !am.embedded? && (show_action = v.action(:show, am, associated))
            can_see ? v.link_to(wording, v.url_for(action: show_action.action_name, model_name: am.to_param, id: associated.id), class: 'pjax') : wording
          end.to_sentence(words_connector: ', ', two_words_connector: ' e ', last_word_connector: ' e ').html_safe
        end

      end
    end
  end
end
