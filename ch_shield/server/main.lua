ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterCommand('chaleco', 'superadmin', function(xPlayer, args, showError)
	args.playerId.triggerEvent('ch_shield:armourPlayer')
	args.playerId.triggerEvent('chat:addMessage', {args = {'^5Chaleco', 'Tu Chaleco Fue Devuelto'}})
end, true, {help = 'Dar Maximo de Chaleco a Alguien o a ti Mismo', validate = true, arguments = {
	{name = 'playerId', help = 'the player id', type = 'player'}
}})

ESX.RegisterUsableItem('bulletproof', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('ch_shield:bulletproof', source)
	xPlayer.removeInventoryItem('bulletproof', 1)
end)