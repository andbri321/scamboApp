module Backoffice::AdminsHelper
	OptionsForRoles =  Struct.new(:id,:description)

	def options_for_roles
		options = []

		Admin.roles_i18n.map do |key, value|
		#{"full_acess"=>"Acesso Completo","restrited_access"=>"Acesso Restrito"}
			OptionsForRoles.new(key,value)
		end
		#cria o objeto
		# [<# Struct id: "full access", description: "Acesso Completo">,<# Struct id:restrited_access, description:Acesso Restrito]
	end
end
