# frozen_string_literal: true

class ProfileBlueprint < Blueprinter::Base
    identifier :id
    fields :bio

    view :normal do
        associations :user, blueprint: UserBlueprint, view: :profile
    end
end
