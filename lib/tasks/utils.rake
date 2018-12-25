namespace :utils do

  desc "Cria Administradores Fake"
  task generate_admins: :environment do
  	puts "Cadastrando Administradores"

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
        email: LeroleroGenerator::paragraph(Random.rand(3)),
        member: Merber.all.sample,
        category: Category.all.sample)
    end
    puts "Anúncios cadastrados com sucesso !!"
  end

end
