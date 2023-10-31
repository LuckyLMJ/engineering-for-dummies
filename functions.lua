function allowProductivity(recipe)
    for index, module in pairs(data.raw.module) do
        if module.effect then
            if module.effect.productivity then
                if module.limitation ~= nil then
                    table.insert(data.raw.module[index].limitation, recipe)
                end
            end
        end
    end
end