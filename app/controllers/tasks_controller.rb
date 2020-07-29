class TasksController < ApplicationController
      def new
      end
      
      def create
          @task = Task.new(params.require(:task).permit(:description, :status))
          @task.save #salva no banco de dados criado
          puts params
          redirect_to root_path #faz nova requisição http, assim nao precisa criar a view create.html.erb
      end
          
end       
