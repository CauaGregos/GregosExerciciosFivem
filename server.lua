-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPC = Tunnel.getInterface("vRP")

------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("gregos-exercicios",cRP)
vCLIENT = Tunnel.getInterface("gregos-exercicios")


function cRP.startAnim(anim,b,prop)
	local source = source
	if source ~= nil then
		vRPC.playAnim(source,false,{anim,b},false)
		TriggerClientEvent("inventory:blockButtons",source,true)
	end
end

function cRP.stopAnim()
	local source = source
	if source ~= nil then
		vRPC.stopAnim(source,false)
		TriggerClientEvent("inventory:blockButtons",source,false)
	end
end

function cRP.startExercice(qtd)
	local source = source
	local user_id = vRP.getUserId(source)

	if user_id then
		vRP.setBackpackInExercice(user_id,qtd)
		TriggerClientEvent("Notify",source,"azul","Bora monstro, adquirido mais "..qtd.."kg na mochila!",8000)
	end
end

function cRP.stopExercice()
	local source = source
	local user_id = vRP.getUserId(source)

	if user_id then
		TriggerClientEvent("Notify",source,"verde","Sessão de exercícios finalizada, inicie outra sessão caso queira mais mochila",5000)
	end
end
 function checkBackpack()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getBackpack(user_id) >= 119 then
			TriggerClientEvent("Notify",source,"cancel","Sua mochila atingiu o máximo",5000)
			return false
		else 
			return true
		end
	end
 end

