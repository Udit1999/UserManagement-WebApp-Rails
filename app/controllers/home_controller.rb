class HomeController < ApplicationController

    def index

    end

    def show
        @user = User.find(params[:id])
        respond_to do |format|
            format.json { render :json=>  {:status => 200, :response=>@user }}
            format.html { @user}
          end
    end

    def all
        @all_users = User.all
        @user = User.find(current_user.id)
        respond_to do |format|
            if @user.usertype == "Admin"
                format.json { render :json=>  {:status => 200, :response=>@all_users }}
                format.html { @all_users}
            else
                format.json { head :no_content }
                format.html { redirect_to root_path ,notice: "You do not have permission to view this"}
            end
        end
    end

    def other_edit
        @user = User.find(params[:id])
        if @user.id==current_user.id
            render edit
        else
            respond_to do |format|
                format.html {@user}
                end
        end
    end

    def other_update
        @user = User.find(params[:id])
        if current_user.usertype == "Admin" or @user.id==current_user.id
            if @user.update(user_params)
                redirect_to users_show_path(:id => @user.id)
            else
                render other_edit
            end
        else
            render :html=> root_path ,notice: "You do not have permission to view this"
        end
    end

    def other_destroy
        @user = User.find(params[:id])
        @user.destroy    
        redirect_to root_path
      end

    private
    def user_params
      params.require(:user).permit(:name, :email, :password, :usertype)
    end

end
