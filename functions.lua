function allowProductivity(recipe)
    for thing, _ in pairs(data.raw.module) do
        if string.find(thing, "prod") then
            if (data.raw["module"][thing].limitation ~= nil) then
                table.insert(data.raw["module"][thing].limitation, recipe)
            end
        end
    end
end