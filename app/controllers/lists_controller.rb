class ListsController < ApplicationController
    def index
        @lists = List.all
    end
    
    def show
        @list = List.find(params[:id])
    end

    def new
        @list = List.new   
    end

    def create
        @list = List.new(list_params)
        
        @list.user_id = current_user.id
        
        if @list.save
           
            redirect_to root_path
          else
            render 'new'
          end

          def edit
            @list = List.find(params[:id])
          end
        
          def update
            @list = List.find(params[:id])
            if @list.update(list_params)
              flash[:success]="List Title was successfully updated"
              redirect_to list_path(@list)
            else
              render 'edit'
            end

          def destroy
            @list = List.find(params[:id])
            @list.destroy
          end
    end
    private

    def list_params
        params.require(:list).permit(:title)
      end

      def require_admin
		if current_user.admin? != true
			flash[:danger] = "You not allowed to do this only admin can do it"
			redirect_to root_path
end
