ESX = nil
PlayerData = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('kagan-itemver')
AddEventHandler('kagan-itemver', function(itemreward, count)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    xPlayer.addInventoryItem(itemreward, count)
end)

RegisterServerEvent('luck_vezne:kir')
AddEventHandler('luck_vezne:kir', function(item, count)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    xPlayer.removeInventoryItem(item, count)
end)

RegisterServerEvent("luck_vezne:alarms")
AddEventHandler("luck_vezne:alarms", function(toggle, coords)
    if Config.Alarm then
        TriggerClientEvent("luck_vezne:alarm", -1, toggle, coords)
    end
end)

RegisterServerEvent('kagan:kapiyiac')
AddEventHandler('kagan:kapiyiac', function(bankid)
    for _, bank in pairs(Config.Banks) do
        if bank.id == bankid then
            TriggerClientEvent('banking:CloseBank', -1, bank.id)
            bank.cdoor.open = true
            bank.cdoor.opentime = os.time(t)
            bank.cashierlr = os.time(t) + Config.CounterCooldowns.Between
            bank.cashlock = true
        end
    end
    TriggerClientEvent('lsrp-banks:sendBanking', -1, Config.Banks)
end)



ESX.RegisterServerCallback('kagan:policeCount', function(source, cb)
	local xPlayers = ESX.GetPlayers()
	CopsConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
			CopsConnected = CopsConnected + 1
		end
	end
  print(CopsConnected)
	cb(CopsConnected)
end)

ESX.RegisterServerCallback('kagan:getItemAmount', function(source, cb, item)
    local xPlayer = ESX.GetPlayerFromId(source)
    local quantity = xPlayer.getInventoryItem(item).count
    
    cb(quantity)
end)

