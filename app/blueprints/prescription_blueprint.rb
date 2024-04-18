# frozen_string_literal: true

class PrescriptionBlueprint < Blueprinter::Base
    identifier :id

    # association :pet, blueprint: PetBlueprint, view: :normal
    association :vet, blueprint: VetBlueprint, view: :normal
    association :med, blueprint: MedBlueprint, view: :normal

    view :timeline do
        fields :frequency
    end

    view :normal do
        fields :frequency, :duration, :date_prescribed
    end


end
