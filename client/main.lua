local function EnableSubmix()
    SetAudioSubmixEffectRadioFx(0, 0)
    SetAudioSubmixEffectParamInt(0, 0, `default`, 1)
    SetAudioSubmixEffectParamFloat(0, 0, `freq_low`, 200.0)
    SetAudioSubmixEffectParamFloat(0, 0, `freq_hi`, 9000.0)
    SetAudioSubmixEffectParamFloat(0, 0, `fudge`, 0.5)
    SetAudioSubmixEffectParamFloat(0, 0, `rm_mix`, 19.0)
end

local function DisableSubmix()
    if IsEntityPlayingAnim(PlayerPedId(), "molly@megaphone", "megaphone_clip", 3) then
        ExecuteCommand('e c')
    end
    SetAudioSubmixEffectRadioFx(0, 0)
end 

local usingMegaphone = false

RegisterNetEvent('megaphone:use')
AddEventHandler('megaphone:use', function()
    if usingMegaphone then 
        DisableSubmix() 
    end
    usingMegaphone = not usingMegaphone
    CreateThread(function()
        while usingMegaphone do
            if not IsEntityPlayingAnim(PlayerPedId(), "molly@megaphone", "megaphone_clip", 3) then
                ExecuteCommand('e megaphone')
            end
            EnableSubmix()
            Wait(100)
        end
    end)
end)


