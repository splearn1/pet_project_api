# frozen_string_literal: true

class PetBlueprint < Blueprinter::Base
    identifier :id

    view :short do
        fields :name
    end

    view :short_with_rx do
        fields :name

        association :prescriptions, blueprint: PrescriptionBlueprint, view: :short
    end

    view :normal do
        fields :name, :species
    end

    view :extended do
        fields :name, :species, :breed, :user_id
    end
end
