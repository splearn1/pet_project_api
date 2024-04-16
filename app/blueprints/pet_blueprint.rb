# frozen_string_literal: true

class PetBlueprint < Blueprinter::Base
    identifier :id

    view :short do
        fields :name
    end

    view :timeline do
        fields :name

        association :prescriptions, blueprint: PrescriptionBlueprint, view: :timeline
    end

    view :normal do
        fields :name, :species
    end

    view :extended do
        fields :name, :species, :breed, :user_id
    end
end
