
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer	
end)

RegisterCommand("change", function()

	GetNaked()
	   
end, false)

RegisterCommand("swim", function()

	SwimSuit()
	   
end, false)



RegisterCommand("changeback", function()

	ResetSkin()
	   
end, false)

function GetNaked()
	TriggerEvent('skinchanger:getSkin', function()
		if GetEntityModel(PlayerPedId()) == `mp_m_freemode_01` then
			TriggerEvent('skinchanger:loadSkin', {
				sex      = 0,
				tshirt_1 = 2,
				tshirt_2 = 2,
				arms     = 1,
				torso_1  = 161,
				torso_2  = 3,
				pants_1  = 9,
				pants_2  = 7,
				--shoes_1 = 15,
				--shoes_1 = 0,
				helmet_1 = 82,
				helmet_2 = 6
			})
		else
			TriggerEvent('skinchanger:loadSkin', {
				sex      = 1,
				tshirt_1 = 34,
				tshirt_2 = 0,
				arms     = 15,
				torso_1  = 101,
				torso_2  = 1,
				pants_1  = 16,
				pants_2  = 0,
				shoes_1 = 43,
				shoes_2 = 0,
				glasses_1 = 0,
				glasses_2 = 0
			})
		end
	end)
end

function SwimSuit()
	TriggerEvent('skinchanger:getSkin', function()
		if GetEntityModel(PlayerPedId()) == `mp_m_freemode_01` then
			TriggerEvent('skinchanger:loadSkin', {
				sex      = 0,
				tshirt_1 = 15,
				tshirt_2 = 0,
				arms     = 15,
				torso_1  = 91,
				torso_2  = 0,
				pants_1  = 14,
				pants_2  = 1,
				shoes_1 = 1,
				shoes_1 = 14,
				glasses_1 = 5,
				glasses_2 = 0
			})
		else
			TriggerEvent('skinchanger:loadSkin', {
				sex      = 1,
				tshirt_1 = 34,
				tshirt_2 = 0,
				arms     = 15,
				torso_1  = 18,
				torso_2  = 3,
				pants_1  = 17,
				pants_2  = 3,
				shoes_1 = 6,
				shoes_2 = 0,
				glasses_1 = 0,
				glasses_2 = 0,
				bag       = 0
			})
		end
	end)
end

function ResetSkin()
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		TriggerEvent('skinchanger:loadSkin', skin)
	end)
	ClearPedDecorations(PlayerPedId())
	for k, v in pairs(currentTattoos) do
		if v.Count ~= nil then
			for i = 1, v.Count do
				SetPedDecoration(PlayerPedId(), v.collection, v.nameHash)
			end
		else
			SetPedDecoration(PlayerPedId(), v.collection, v.nameHash)
		end
	end
end

RegisterCommand('god', function(source, args)
  god = not god
  if god then
  SetEntityInvincible(GetPlayerPed(-1), true)
  notification("~g~God Mode On")
else
  SetEntityInvincible(GetPlayerPed(-1), false)
  notification("~r~God Mode Off")
  end
end)


RegisterCommand("fix", function()

	Fix()
	   
end, false)

function Fix()

	local playerPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed, false) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		SetVehicleEngineHealth(vehicle, 1000)
		SetVehicleEngineOn( vehicle, true, true )
		SetVehicleFixed(vehicle)
		notification("~g~Your vehicle has been fixed!")
	else
		notification("~o~You're not in a vehicle! There is no vehicle to fix!")
	end
end

function notification(msg)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(msg)
	DrawNotification(false, false)
end

