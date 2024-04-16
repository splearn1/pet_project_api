# frozen_string_literal: true

class UserBlueprint < Blueprinter::Base
    identifier :id


    # associations :pets, blueprint: PetBlueprint, view: :normal do |user|
    #     user.pets.all
    # end

    view :timeline do
        fields :username, :first_name

        association :pets, blueprint: PetBlueprint, view: :timeline
        # association :prescriptions, blueprint: PrescriptionBlueprint, view: :short
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
