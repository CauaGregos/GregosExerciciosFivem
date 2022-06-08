-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPC = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("gregos-exercicios",cRP)
vCLIENT = Tunnel.getInterface("gregos-exercicios")
vSERVER = Tunnel.getInterface("gregos-exercicios")


-----------------------------------------------------------------------------------------------------------------------------------------
-- Exercicios
-----------------------------------------------------------------------------------------------------------------------------------------
local Config = {
    -- BARRA é o nome do exercicio
	[1] = {
        ["nome"] = "Barra",
		["coords"] = {-1205.03,-1563.95,4.6,215.44},
		--Aqui temos a duração de cada sessão desse exercicio, ou seja, acada 13 segundos acaba e seta a mochila
		["duration"] = 13,
		["animation"] = {"amb@prop_human_muscle_chin_ups@male@base","base"},
        -- Importante se a animação tiver props envolvidos deixe nill caso contrario
        ["animationName"] = "malhar2",
        -- de quanto em quanto a mochila vai aumentar
        ["backpackUp"] = 0.5,
        -- evento de anim especifico caso tenha, do contrario colocar nil
        ["event"] = "emotes"
	},
    [2] = {
        ["nome"] = "Biceps",
		["coords"] = {-1202.72,-1565.35,4.62,218.27},
		["duration"] = 13,
		["animation"] = {"amb@world_human_muscle_free_weights@male@barbell@base","base"},
        ["animationName"] = "malhar",
        ["backpackUp"] = 0.7,
        ["event"] = "emotes"
	},
    [3] = {
        ["nome"] = "Barra",
		["coords"] = {-1225.047,-1600.19,4.18,85.04},
		["duration"] = 13,
		["animation"] = {"amb@prop_human_muscle_chin_ups@male@base","base"},
        ["animationName"] = nil,
        ["backpackUp"] = 0.5,
        ["event"] = "emotes"
	},
    [4] = {
        ["nome"] = "Barra",
		["coords"] = {-1240.25,-1599.69,4.16,31.19},
		["duration"] = 13,
		["animation"] = {"amb@prop_human_muscle_chin_ups@male@base","base"},
        ["animationName"] = nil,
        ["backpackUp"] = 0.5,
        ["event"] = "emotes"
	},
    [5] = {
        ["nome"] = "Barra",
		["coords"] = {-1199.74,-1571.52,4.6,31.19},
		["duration"] = 13,
		["animation"] = {"amb@prop_human_muscle_chin_ups@male@base","base"},
        ["animationName"] = nil,
        ["backpackUp"] = 0.5,
        ["event"] = "emotes"
	},
    
    

}


-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERSPAWN
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playerSpawn",function(user_id,source)
	vCLIENT.updateWorks(source,Config)
end)


Citizen.CreateThread(function()
	Citizen.Wait(1000)
	vCLIENT.updateAcademia(-1,Config)
end)