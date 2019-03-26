namespace :dev do

  desc "Setup Development"
  task setup: :environment do
    images_path = Rails.root.join('public','system')
  	puts "Executando o setup para desenvolvimento..."

    puts "Apagando banco de dados...#{%x(rake db:drop)}"
    puts "Apagando imagens de public/system #{%x(rm -rf #{images_path})}"
    puts "Criando banco de dados...#{%x(rake db:create)}"
    puts %x(rake db:migrate)
    puts %x(rake db:seed)
    puts %x(rake dev:generate_admins)
    puts %x(rake dev:generate_members)
    puts %x(rake dev:generate_ads)
    # Não exibe a ação que esta sendo executada
    # %x(rake utils:generate_ads)

  	puts "Setup completado com sucesso !"
  end

  ##########################################################

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
  	puts "Administrador cadastrados com sucesso !"
  end

  ##########################################################

  desc "Cria Membros Fake"
  task generate_members: :environment do
  	puts "Cadastrando Membros"
    # Admin.create(email:"admin@gmail.com",name:"admin",role:1,password:"123123",password_confirmation: "123123")
  	100.times do
  		Member.create!(
        email: Faker::Internet.email,
  			password: "123123",
  			password_confirmation: "123123")
  	end
  	puts "Membros cadastrados com sucesso !"
  end

  ##########################################################

  desc "Cria Anúncios Fake"
  task generate_ads: :environment do
    puts "Cadastrando Anúncios"

    5.times do
      Ad.create!(
        title: Faker::Lorem.sentence([2,3,4,5].sample),
        description: LeroleroGenerator::paragraph(Random.rand(3)),
        member: Member.first,
        category: Category.all.sample,
        price: "#{Random.rand(500)},#{Random.rand(99)}",
        picture: File.new(Rails.root.join('public','templates','images-for-ads',"#{Random.rand(9)}.jpg"),'r')
      )
    end

    100.times do
      Ad.create!(
        title: Faker::Lorem.sentence([2,3,4,5].sample),
        description: LeroleroGenerator::paragraph(Random.rand(3)),
        member: Member.all.sample,
        category: Category.all.sample,
        price: "#{Random.rand(500)},#{Random.rand(99)}",
        picture: File.new(Rails.root.join('public','templates','images-for-ads',"#{Random.rand(9)}.jpg"),'r')
      )
    end
    puts "Anúncios cadastrados com sucesso !!"
  end

  ##########################################################

  desc "Cria Categorias"
  task generate_category: :environment do
    puts "Cadastrando Categorias"
    Category.destroy_all
    categorias = ['Animais e acessórios', 'Esportes', 'Para a sua casa','Moda e beleza','Bebês e crianças']
    categorias.each { |categoria| Category.create!(description: categoria) }
    puts "Categorias cadastradas com sucesso !!"
  end

end
