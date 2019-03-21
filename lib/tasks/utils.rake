namespace :utils do

  desc "Cria Administradores Fake"
  task generate_admins: :environment do
  	puts "Cadastrando Administradores"
    # Admin.create(email:"admin@gmail.com",name:"admin",role:1,password:"123123",password_confirmation: "123123")
  	10.times do
  		Admin.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
  			password: "123123",
  			password_confirmation: "123123",
        role: [0,1,1,1].sample)
  	end
  	puts "Administrador cadastrados com sucesso !!"
  end

  desc "Cria Anúncios Fake"
  task generate_ads: :environment do
    puts "Cadastrando Anúncios"

    100.times do
      Ad.create!(
        title: Faker::Lorem.sentence([2,3,4,5].sample),
        description: LeroleroGenerator::paragraph(Random.rand(3)),
        member: Member.all.sample,
        category: Category.all.sample,
        price: "#{Random.rand(500)},#{Random.rand(99)}")
    end
    puts "Anúncios cadastrados com sucesso !!"
  end

  desc "Cria Categorias"
  task generate_category: :environment do
    puts "Cadastrando Categorias"
    Category.destroy_all
    categorias = ['Animais e acessórios', 'Esportes', 'Para a sua casa','Moda e beleza','Bebês e crianças']
    categorias.each { |categoria| Category.create!(description: categoria) }
    puts "Categorias cadastradas com sucesso !!"
  end

end
