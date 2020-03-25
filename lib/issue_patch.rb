module Covid19IssuePatch
  module Patches
    module IssuePatch
      def self.included(base)
        base.class_eval do
          unloadable

          validate :contingent_require

          protected
          def contingent_require
			reason = custom_field_values.detect {|v| v.custom_field_id == 12 }
			contigent = custom_field_values.detect {|v| v.custom_field_id == 7 }
			status = custom_field_values.detect {|v| v.custom_field_id == 13 }
			transfer = custom_field_values.detect {|v| v.custom_field_id == 8 }
			
            if reason.value == "ТМК" && contigent.value == ""
				errors.add :base, l('contingent_required')
			end
			if (status.value == "Передано в ФДКЦ" || status.value == "ФДКЦ недоступен") && transfer.value == ""
				errors.add :base, l('transfer_required')
			end
			
			return true
          end

        end
      end
    end
  end
end