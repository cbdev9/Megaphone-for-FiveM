local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem('megaphone', function(source, item)
    TriggerClientEvent('megaphone:use', source)
end)