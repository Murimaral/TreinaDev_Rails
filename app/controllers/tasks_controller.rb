class TasksController < ApplicationController
      def new
      end
      
      def create
          @task = Task.new(params.require(:task).permit(:description, :status))
          @task.save #salva no banco de dados criado
          puts params
          redirect_to root_path #faz nova requisição http, assim nao precisa criar a view create.html.erb
      end
      def edit
        @task = Task.find(params[:id]) #olhando o routes, vemos o nome do param na rota edit
      end
      def update
        @task = Task.find(params[:id]) #o metodo Edit gera na tela o formulario com os dados antigos pré-preenchidos
        #agora em UPDATE é necessario chamar de novo o Task.find para atualizar
        @task.update(params.require(:task).permit(:description, :status))
        redirect_to root_path
      end
      def destroy
         task = Task.find(params[:id]) #nao precisa do @ pq nao temos a view que usara esse objeto
         task.destroy #destroi a tarefa encontrada
         redirect_to root_path
      end      
          
end       
