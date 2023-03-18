if Config.Framework == 'qb-core' then
    local QBCore = exports['qb-core']:GetCoreObject()
    
    QBCore.Functions.CreateUseableItem('megaphone', function(source)
        TriggerClientEvent('megaphone:use', source)
    end)
elseif Config.Framework == 'esx' then
    local ESX = exports['es_extended']:getSharedObject()

    ESX.RegisterUsableItem('megaphone', function(source)
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            TriggerClientEvent('megaphone:use', source)
        end
    end)
end

RegisterNetEvent('megaphone:applySubmix', function(bool)
    TriggerClientEvent('megaphone:updateSubmixStatus', -1, bool, source)
end)