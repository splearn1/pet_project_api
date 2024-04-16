# frozen_string_literal: true

class PrescriptionBlueprint < Blueprinter::Base
    identifier :id

    # association :pet, blueprint: PetBlueprint, view: :normal
    association :vet, blueprint: VetBlueprint, view: :normal
    association :med, blueprint: MedBlueprint, view: :normal

    view :short do
        fields :frequency
    end

    view :normal do
        fields :frequency, :duration, :date_prescribed
    end

    view :extended do
        fields :frequency, :duration, :date_prescribed, :pet_id, :vet_id, :med_id, :created_at, :updated_at
    end
end
