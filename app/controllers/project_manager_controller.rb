class ProjectManagerController < ApplicationController

    private

    def project_manager_params
        params.require(:project_manager).permit(:first_name, :last_name, :email, :password, :company_name)
    end
end