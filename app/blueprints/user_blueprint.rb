# frozen_string_literal: true

class UserBlueprint < Blueprinter::Base
    identifier :id


    view :timeline do
        fields :username, :first_name

        association :pets, blueprint: PetBlueprint, view: :timeline
        # association :prescriptions, blueprint: PrescriptionBlueprint, view: :short  view not used
        # association :meds, blueprint: MedBlueprint, view: :normal
    end

    view :normal do
        fields :first_name, :last_name, :email, :username

        association :pets, blueprint: PetBlueprint, view: :normal 
    end

    # view :default do
    #     fields :first_name, :email, :username
    # end

end
