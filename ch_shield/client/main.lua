ESX								= nil
chaleco = false
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('ch_shield:armourPlayer')
AddEventHandler('ch_shield:armourPlayer', function()
	-- restore shield
	local playerPed = PlayerPedId()
	AddArmourToPed(playerPed, 100)
	SetPedArmour(playerPed, 100)
end)

RegisterNetEvent('ch_shield:bulletproof')
AddEventHandler('ch_shield:bulletproof', function()
	local playerPed = PlayerPedId()
	SetPedComponentVariation(playerPed, 9, 27, 9, 2)
	AddArmourToPed(playerPed, 100)
	SetPedArmour(playerPed, 100)
	ESX.ShowHelpNotification("Te has equipado el chaleco antibalas")
end)

Citizen.CreateThread(function()
	if chaleco == false then
		while true do
			Citizen.Wait(10)
			if IsEntityDead(ped) then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
					TriggerEvent('skinchanger:loadSkin', skin)
				end)
			end
		end
	end
end)