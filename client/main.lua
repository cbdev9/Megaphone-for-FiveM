local function DisableSubmix()
    if IsEntityPlayingAnim(PlayerPedId(), "molly@megaphone", "megaphone_clip", 3) then
        ExecuteCommand('e c')
    end
    TriggerServerEvent('megaphone:applySubmix', false)
end 

local usingMegaphone = false

RegisterNetEvent('megaphone:use')
AddEventHandler('megaphone:use', function()
    if usingMegaphone then 
        DisableSubmix()
        exports["pma-voice"]:clearProximityOverride()
    end
    usingMegaphone = not usingMegaphone
    CreateThread(function()
        if usingMegaphone then
            TriggerServerEvent('megaphone:applySubmix', true)
            exports["pma-voice"]:overrideProximityRange(30.0, true)
        end
        while usingMegaphone do
            if not IsEntityPlayingAnim(PlayerPedId(), "molly@megaphone", "megaphone_clip", 3) then
                ExecuteCommand('e megaphone')
            end
            Wait(100)
        end
    end)
end)

local data = {
    [`default`] = 0,
    [`freq_low`] = 0.0,
    [`freq_hi`] = 10000.0,
    [`rm_mod_freq`] = 300.0,
    [`rm_mix`] = 0.2,
    [`fudge`] = 0.0,
    [`o_freq_lo`] = 200.0,
    [`o_freq_hi`] = 5000.0,
}

local filter

CreateThread(function()
    filter = CreateAudioSubmix("Megaphone")
    SetAudioSubmixEffectRadioFx(filter, 0)
    for hash, value in pairs(data) do
        SetAudioSubmixEffectParamInt(filter, 0, hash, 1)
    end
    AddAudioSubmixOutput(filter, 0)
end)

RegisterNetEvent('megaphone:updateSubmixStatus', function(state, source)
    if state then
        MumbleSetSubmixForServerId(source, filter)
    else
        MumbleSetSubmixForServerId(source, -1)
    end
end)
