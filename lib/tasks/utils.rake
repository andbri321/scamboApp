namespace :utils do

  desc "Cria Administradores Fake"
  task generate_admins: :environment do
  	puts "Cadastrando Administradores"

  	10.times do 
  		Admin.create!(email: Faker::Internet.email,
  			password: "123123",
  			password_confirmation: "123123"
  			)
  	end
  	puts "Administrador cadastrados com sucesso !!"
  end

end
