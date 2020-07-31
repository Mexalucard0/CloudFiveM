ESX = nil
PlayerData = {}
soygun = false
ara1 = false
ara2 = false
ara3 = false
soygun1 = false
local alarmblip
local streetName, playerGender

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

    TriggerEvent('skinchanger:getSkin', function(skin)
		playerGender = skin.sex
	end)

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)




local arananyerler1 = {
    [1] = {x = 311.54, y = -279.69, z = 54.16, info = 'Motel Karşısı'},
    [2] = {x = 148.08, y = -1041.64, z = 29.37, info = 'FLECCA11'},
    [3] = {x = -2961.09, y = 481.38, z = 15.7, info = 'FLECCA21'},
    [4] = {x = -352.82, y = -50.78, z = 49.04, info = 'FLECCA31'},
    [5] = {x = 1176.53, y = 2708.31, z = 38.09, info = 'FLECCA41'},
}

local arananyerler2 = {
    [1] = {x = 312.97, y = -280.23, z = 54.16, info = 'Motel Karşısı'},
    [2] = {x = 149.46, y = -1042.07, z = 29.37, info = 'FLECCA12'},
    [3] = {x = -2961.09, y = 482.99, z = 15.7, info = 'FLECCA22'},
    [4] = {x = -351.34, y = -51.26, z = 49.04, info = 'FLECCA32'},
    [5] = {x = 1174.96, y = 2708.26, z = 38.09, info = 'FLECCA42'},
}

local arananyerler3 = {
    [1] = {x = 314.93, y = -280.95 , z = 54.16, info = 'Motel Karşısı'},
    [2] = {x = 151.02, y = -1042.63, z = 29.37, info = 'FLECCA13'},
    [3] = {x = -2961.07, y = 484.44, z = 15.7, info = 'FLECCA23'},
    [4] = {x = -349.92, y = -51.8, z = 49.04, info = 'FLECCA33'},
    [5] = {x = 1173.45, y = 2708.21, z = 38.09, info = 'FLECCA43'},
}

local kapicoords = {
    [1] = {x = 309.56, y = -279.52, z = 54.16, info = 'Motel Karşısı'},
    [2] = {x = 145.16, y = -1041.16, z = 29.37, info = 'Fleeca'}
}


function DrawText3D(x,y,z,text,size)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35,0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 100)
end


Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)

        for k,v in pairs(arananyerler1) do
            if Vdist2(GetEntityCoords(PlayerPedId(), false), v.x, v.y, v.z) < 1.5 then
                if soygun == true then
                    if ara1 == false then 
                        DrawText3D(v.x, v.y, v.z, 'Ara')
                        if IsControlJustPressed(0, 38) then
                            TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
                            local finished = exports['pogressBar']:drawBar(8300, "Arıyorsun")
                            Citizen.Wait(8300)
                            ClearPedTasksImmediately(PlayerPedId())
                            local ItemMiktar = math.random(1, 5)
                            if ItemMiktar == 1 then 
                                item = Config.Item1
                                count = Config.Miktar
                                itemname = "nakit"
                                exports['mythic_notify']:DoHudText('success',  count.." tane "..itemname.." buldun.")
                                TriggerServerEvent("kagan-itemver", item, count)
                            end
                            if ItemMiktar == 2 then 
                                item = Config.Item2
                                count = Config.Miktar
                                itemname = "nakit"
                                exports['mythic_notify']:DoHudText('success',  count.." tane "..itemname.." buldun.")
                                TriggerServerEvent("kagan-itemver", item, count)
                            end
                            if ItemMiktar == 3 then 
                                item = Config.Item3
                                count = Config.Miktar
                                itemname = "nakit"
                                exports['mythic_notify']:DoHudText('success',  count.." tane "..itemname.." buldun.")
                                TriggerServerEvent("kagan-itemver", item, count)
                            end
                            if ItemMiktar == 4 then 
                                item = Config.Item4
                                count = Config.Miktar
                                itemname = "nakit"
                                exports['mythic_notify']:DoHudText('success',  count.." tane "..itemname.." buldun.")
                                TriggerServerEvent("kagan-itemver", item, count)
                            end
                            if ItemMiktar == 5 then 
                                item = Config.Item1
                                count = Config.Miktar
                                itemname = "nakit"
                                exports['mythic_notify']:DoHudText('success',  count.." tane "..itemname.." buldun.")
                                TriggerServerEvent("kagan-itemver", item, count)
                            end
                            ara1 = true
                        end
                    end 
                end
            end
        end

        for a,b in pairs(arananyerler2) do 
            if Vdist2(GetEntityCoords(PlayerPedId(), false), b.x, b.y, b.z) < 1.5 then
                if soygun == true then
                    if ara2 == false then 
                        DrawText3D(b.x, b.y, b.z, 'Ara')
                        if IsControlJustPressed(0, 38) then
                            TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
                           local finished = exports['pogressBar']:drawBar(8300, "Arıyorsun")
                           Citizen.Wait(8300)
                           ClearPedTasksImmediately(PlayerPedId())
                            local ItemMiktar = math.random(1, 5)
                            if ItemMiktar == 1 then 
                                item = Config.Item1
                                count = Config.Miktar1
                                itemname = "nakit"
                                exports['mythic_notify']:DoHudText('success',  count.." tane "..itemname.." buldun.")
                                TriggerServerEvent("kagan-itemver", item, count)
                            end
                            if ItemMiktar == 2 then 
                                item = Config.Item2
                                count = Config.Miktar1
                                itemname = "nakit"
                                exports['mythic_notify']:DoHudText('success',  count.." tane "..itemname.." buldun.")
                                TriggerServerEvent("kagan-itemver", item, count)
                            end
                            if ItemMiktar == 3 then 
                                item = Config.Item3
                                count = Config.Miktar1
                                itemname = "nakit"
                                exports['mythic_notify']:DoHudText('success',  count.." tane "..itemname.." buldun.")
                                TriggerServerEvent("kagan-itemver", item, count)
                            end
                            if ItemMiktar == 4 then 
                                item = Config.Item4
                                count = Config.Miktar1
                                itemname = "nakit"
                                exports['mythic_notify']:DoHudText('success',  count.." tane "..itemname.." buldun.")
                                TriggerServerEvent("kagan-itemver", item, count)
                            end
                            if ItemMiktar == 5 then 
                                item = Config.Item1
                                count = Config.Miktar1
                                itemname = "nakit"
                                exports['mythic_notify']:DoHudText('success',  count.." tane "..itemname.." buldun.")
                                TriggerServerEvent("kagan-itemver", item, count)
                            end
                            ara2 = true
                        end
                    end
                end
            end
        end 

        for c,d in pairs(arananyerler3) do 
            if Vdist2(GetEntityCoords(PlayerPedId(), false), d.x, d.y, d.z) < 1.5 then
                if soygun == true then
                    if ara3 == false then 
                        DrawText3D(d.x, d.y, d.z, 'Ara')
                        if IsControlJustPressed(0, 38) then
                            TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
                           local finished = exports['pogressBar']:drawBar(8300, "Arıyorsun")
                           Citizen.Wait(8300)
                           ClearPedTasksImmediately(PlayerPedId())
                            local ItemMiktar = math.random(1, 5)
                            if ItemMiktar == 1 then 
                                item = Config.Item1
                                count = Config.Miktar2
                                itemname = "nakit"
                                 exports['mythic_notify']:DoHudText('success',  count.." tane "..itemname.." buldun.")
                                TriggerServerEvent("kagan-itemver", item, count)
                            elseif ItemMiktar == 2 then 
                                item = Config.Item2
                                count = Config.Miktar2
                                itemname = "nakit"
                                 exports['mythic_notify']:DoHudText('success',  count.." tane "..itemname.." buldun.")
                                TriggerServerEvent("kagan-itemver", item, count)
                            elseif ItemMiktar == 3 then 
                                item = Config.Item3
                                count = Config.Miktar2
                                itemname = "nakit"
                                 exports['mythic_notify']:DoHudText('success',  count.." tane "..itemname.." buldun.")
                                TriggerServerEvent("kagan-itemver", item, count)
                            elseif ItemMiktar == 4 then 
                                item = Config.Item4
                                count = Config.Miktar2
                                itemname = "nakit"
                                 exports['mythic_notify']:DoHudText('success',  count.." tane "..itemname.." buldun.")
                                TriggerServerEvent("kagan-itemver", item, count)
                            elseif ItemMiktar == 5 then 
                                item = Config.Item1
                                count = Config.Miktar2
                                itemname = "nakit"
                                 exports['mythic_notify']:DoHudText('success',  count.." tane "..itemname.." buldun.")
                                TriggerServerEvent("kagan-itemver", item, count)
                            end
                            ara3 = true
                        end
                    end
                end
            end
        end 
    end
end)

function loadAnimDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(5)
    end
end

AddEventHandler('lockpickAnimation', function()
    loadAnimDict('veh@break_in@0h@p_m_one@')
    TaskPlayAnim(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 1.0, 1.0, 1.0, 1, 0.0, 0, 0, 0)
   ClearPedTasksImmediately(PlayerPedId())
end)

RegisterNetEvent('luck_vezne:alarm')
AddEventHandler('luck_vezne:alarm', function(status, coords)
    if status == 1 then
        PlaySound = true
        if not DoesBlipExist(alarmblip) then
            alarmblip = AddBlipForCoord(coords.x, coords.y, coords.z)
            SetBlipSprite(alarmblip, 161)
            SetBlipScale(alarmblip, 2.0)
            SetBlipColour(alarmblip, 1)

            PulseBlip(alarmblip)
        end
    elseif status == 2 then
        PlaySound = false
        RemoveBlip(alarmblip)
        SendNUIMessage({transactionType = 'stopSound'})
    end
end)


Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        for k,v in pairs(kapicoords) do
            if Vdist2(GetEntityCoords(PlayerPedId(), false), v.x, v.y, v.z) < 1.5 then
                DrawText3D(v.x, v.y, v.z, '[E] ile Kapıyı Zorla')
                if IsControlJustPressed(0, 38) then
                    if soygun1 == false then 
                        local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
                        local coords = GetEntityCoords(PlayerPedId())

                        streetName,_ = GetStreetNameAtCoord(x, y, z)
                        streetName = GetStreetNameFromHashKey(streetName)
                        TriggerServerEvent('edz_outlawalert:robberyProgress', coords, streetName, playerGender, '10-31', 'Vezne Soygunu')
                        ESX.TriggerServerCallback('kagan:getItemAmount', function(quantity)
                            if quantity >= 1 then
                                ESX.TriggerServerCallback('kagan:policeCount', function(count)
                                    if count >= Config.PoliceCount then
                                        local bits = exports["reload-skillbar"]:taskBar(4000,math.random(5,15))
                                        if bits ~= 100 then
                                            TriggerEvent('notification', "Başaramadın!", 2)
                                            TriggerServerEvent("luck_vezne:kir", 'lockpick', 1)
                                            TriggerServerEvent("luck_vezne:alarms", 1, coords)
                                            exports['mythic_notify']:DoHudText('error', "Alarm devreye girdi!")
                                        else
                                            local bits2 = exports["reload-skillbar"]:taskBar(4000,math.random(5,15))
                                            if bits2 ~= 100 then
                                                    TriggerEvent('notification', "Başaramadın!", 2)
                                                    TriggerServerEvent("luck_vezne:kir", 'lockpick', 1)
                                                    TriggerServerEvent("luck_vezne:alarms", 1, coords)
                                                    exports['mythic_notify']:DoHudText('error', "Alarm devreye girdi!")
                                            else
                                                    local bits3 = exports["reload-skillbar"]:taskBar(4000,math.random(5,15))
                                                if bits3 ~= 100 then
                                                    TriggerEvent('notification', "Başaramadın!", 2)
                                                    TriggerServerEvent("luck_vezne:kir", 'lockpick', 1)
                                                    TriggerServerEvent("luck_vezne:alarms", 1, coords)
                                                    exports['mythic_notify']:DoHudText('error', "Alarm devreye girdi!")
                                                else
                                                    TriggerEvent('police:veznerobbery')
                                                    loadAnimDict('veh@break_in@0h@p_m_one@')
                                                    TaskPlayAnim(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 1.0, 1.0, 1.0, 1, 0.0, 0, 0, 0)
                                                    FreezeEntityPosition(PlayerPedId(), true)
                                                   local finished = exports['pogressBar']:drawBar(5000, "Kapıyı Açıyorsun")
                                                   Citizen.Wait(5000)
                                                    TriggerEvent('kagan:kapiac')
                                                   ClearPedTasksImmediately(PlayerPedId())
                                                    FreezeEntityPosition(PlayerPedId(), false)
                                                    soygun = true
                                                    soygun1 = true
                                                    sure = 600000
                                                end
                                            end
                                        end
                                    else 
                                        TriggerEvent('notification', "Yeterince polis yok!", 2)
                                    end
                                end)
                            else 
                                TriggerEvent('notification', "Maymuncugun Yok!", 2)
                            end
                        end, 'lockpick')
                    else
                        TriggerEvent('notification', "Şuanda Banka Soyamazsın", 2)
                    end
                end
            end
        end
    end
end)

RegisterCommand('guvenlik', function()
    if PlayerData.job.name == 'police' or  PlayerData.job.name == 'sheriff' then 
        soygun1 = false
       local finished = exports['pogressBar']:drawBar(2000, "Gunvelik Saglanıyor")
       TriggerServerEvent("luck_vezne:alarms", 2, coords)
    else
        exports['mythic_notify']:DoHudText('error', 'Bu Komutu Sadece Polis yada Sherifler Kullanabilir')
    end
end)

RegisterNetEvent('kagan:kapiac')
AddEventHandler('kagan:kapiac', function()
    local playerPed		= GetPlayerPed(-1)
    local coords		= GetEntityCoords(playerPed)
   ClearPedTasksImmediately(PlayerPedId())

    for _, cashier in pairs(kapicoords) do

        local bankDoor = GetClosestObjectOfType(cashier.x, cashier.y, cashier.z, 1.0, 4163212883, 0, 0, 0)
        local distance = GetDistanceBetweenCoords(cashier.x, cashier.y, cashier.z, coords.x, coords.y, coords.z, true)

        if distance < 0.75 then

            TriggerServerEvent('kagan:kapiyiac', cashier.id)
            SetEntityHeading(bankDoor, cashier.oh)
        end
    end
end)


RegisterNetEvent('kagan:sendBanking')
AddEventHandler('kagan:sendBanking', function(banks)
    Config.Banks = banks
end)





