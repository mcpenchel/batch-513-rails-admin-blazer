Rails.application.routes.draw do
  # Configuração de permissão de acesso está no arquivo config/initializers/rails_admin.rb
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # Para o Blazer, é aqui que fazemos a configuração de permissão de acesso!!
  # Caso em dúvida do quê é essa sintaxe doida, o ->, dê uma olhada nos slides
  # que tem um link para explicar melhor o quê é isso (que é uma lambda).
  authenticate :user, ->(user) { user.admin? } do
    mount Blazer::Engine, at: "blazer"
  end
  devise_for :users
  root to: 'pages#home'
end
