ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('TomN:EmploiChantier')
AddEventHandler('TomN:EmploiChantier', function(jobs)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.setJob('chantier', 0)  
	TriggerClientEvent('esx:showNotification', source, "FantaisieRP \nVous venez de rejoindre le jobs ~p~chantier")
end)