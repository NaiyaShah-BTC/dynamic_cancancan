class Permission < ApplicationRecord

  private

  def params_permission
    params.require(:permission).permit(:subject_class, :action, :name)
  end
end
