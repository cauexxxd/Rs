
local PlaceId = game.PlaceId

local Scripts = {
    
    ["99Nights"] = {
        Ids = {126509999114328},
        Url = ""
    },
    ["BloxFruits"] = {
        Ids = {7449423635, 4442272183, 2753915549},
        Url = "https://raw.githubusercontent.com/cauexxxd/Rs/refs/heads/main/BloxFruits.lua"
    },
    
    ["MurderMystery2"] = {
        Ids = {142823291},
        Url = ""
    }
}

local function getScriptUrl(placeId)
    for name, data in pairs(Scripts) do
        for _, id in ipairs(data.Ids) do
            if id == placeId then
                print("🌀 Carregando script para: " .. name)
                return data.Url
            end
        end
    end
    return nil
end

local function safeLoadUrl(url, scriptName)
    if not url or url == "" then
        warn("⚠️ URL inválida recebida.")
        return
    end

    local ok, contentOrErr = pcall(function() return game:HttpGet(url) end)
    if not ok then
        warn("⚠️ Falha ao obter script " .. (scriptName or "") .. ".")
        return
    end

    local ok2, funcOrErr = pcall(loadstring, contentOrErr)
    if not ok2 or type(funcOrErr) ~= "function" then
        warn("⚠️ Erro ao compilar script " .. (scriptName or "") .. ".")
        return
    end

    local ok3, execErr = pcall(funcOrErr)
    if not ok3 then
        warn("⚠️ Erro ao executar script " .. (scriptName or "") .. ".")
        return
    end

    print("✅ Script " .. (scriptName or "desconhecido") .. " carregado com sucesso.")
end

local ScriptUrl = getScriptUrl(PlaceId)

if ScriptUrl then
    safeLoadUrl(ScriptUrl, "Principal")
else
    warn("❌ Nenhum script configurado para este jogo! PlaceId: " .. PlaceId)
end

local ContadorUrl = "https://raw.githubusercontent.com/cauexxxd/IDk/refs/heads/main/Nice.lua"
safeLoadUrl(ContadorUrl, "Contador")

