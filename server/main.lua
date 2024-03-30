Citizen.CreateThread(function()

    PerformHttpRequest("https://nameday.abalin.net/api/V1/today", function(err, text, headers)

        if text then

            local information = json.decode(text)
            local data = {
                ["{ru}"] = information.nameday.ru,
                ["{us}"] = information.nameday.us,
                ["{ee}"] = information.nameday.ee,
                ["{bg}"] = information.nameday.bg,
                ["{dk}"] = information.nameday.dk,
                ["{lt}"] = information.nameday.lt,
                ["{it}"] = information.nameday.it,
                ["{fr}"] = information.nameday.fr,
                ["{gr}"] = information.nameday.gr,
                ["{hr}"] = information.nameday.hr,
                ["{se}"] = information.nameday.se,
                ["{at}"] = information.nameday.at,
                ["{hu}"] = information.nameday.hu,
                ["{es}"] = information.nameday.es,
                ["{de}"] = information.nameday.de,
                ["{sk}"] = information.nameday.sk,
                ["{cz}"] = information.nameday.cz,
                ["{lv}"] = information.nameday.lv,
                ["{fi}"] = information.nameday.fi,
                ["{pl}"] = information.nameday.pl,
            }
    
            local text = Config.Text:gsub("{(.-)}", function(key)
                return data['{' .. key .. '}'] or key
            end) 
    
            SetConvar("sv_projectDesc", text)

        else

            print("^1[ERROR] ^7Problem with API.")

        end
         
    end)

    if Config.Updater then

        PerformHttpRequest("https://raw.githubusercontent.com/respectdevelopment/versions/main/NameDay", function(err, text, headers)

            if text then

                local ScriptVersion = GetResourceMetadata(GetCurrentResourceName(), "version")
        
                if ScriptVersion == text then
                    print("^2[INFO] rd_NameDay have latest version! ("..ScriptVersion..")^7")
                else
                    print("^3[UPDATE] Update for rd_NameDay is avaible! ("..ScriptVersion.. " -> " ..text.. ")^7")
                    print("^3[UPDATE] https://github.com/respectdevelopment/rd_NameDay^7")
                end

            else

                print("^1[ERROR] ^7Problem with API.")

            end
        end)
        
    end

end)