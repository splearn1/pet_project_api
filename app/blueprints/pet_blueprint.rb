# frozen_string_literal: true

class PetBlueprint < Blueprinter::Base
    identifier :id

    
    view :timeline do
        fields :name

        association :prescriptions, blueprint: PrescriptionBlueprint, view: :timeline
    end

    view :normal do
        fields :name, :species
    end


end
