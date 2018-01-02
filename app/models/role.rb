class Role < ApplicationRecord
  has_and_belongs_to_many :users, :join_table => :users_roles
  has_and_belongs_to_many :permissions

  belongs_to :resource,
             :polymorphic => true,
             :optional => true

  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true

  scopify

  def set_permissions(permissions)
    permissions.each do |id|
    #find the main permission assigned from the UI
    permission = Permission.find(id)
    self.permissions << permission
    case permission.subject_class
    when "Part"
        case permission.action
          #if create part permission is assigned then assign create drawing as well
        when "create"
          self.permissions << Permission.where(subject_class: "Drawing", action: "create")
          #if update part permission is assigned then assign create and delete drawing as well
        when "update"
          self.permissions << Permission.where(subject_class: "Drawing", action: ["update", "destroy"])
        end
      end
    end
  end
end
