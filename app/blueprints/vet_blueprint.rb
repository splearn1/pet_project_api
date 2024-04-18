# frozen_string_literal: true

class VetBlueprint < Blueprinter::Base
    identifier :id


    view :normal do
        fields :name, :email, :phone
    end
end
