# frozen_string_literal: true

class MedBlueprint < Blueprinter::Base
    identifier :id

    view :normal do
        fields :name, :dosage
    end

    
end
