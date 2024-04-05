# frozen_string_literal: true

class PrescriptionBlueprint < Blueprinter::Base
    identifier :id

    associations :pets, blueprint: PetBlueprint, view: :normal
    associations :vets, blueprint: VetBlueprint, view: :normal
    associations :meds, blueprint: MedBlueprint, view: :normal

    view normal do
        fields :frequency, :duration, :date_prescribed
    end

    view extended do
        fields :frequency, :duration, :date_prescribed, :pet_id, :vet_id, :med_id, :created_at, :updated_at
    end
end
