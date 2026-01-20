-- Auto generated script file --

--hide vanilla model
vanilla_model.PLAYER:setVisible(false)

--hide vanilla armor model
vanilla_model.ARMOR:setVisible(false)
local armor = false

events.ENTITY_INIT:register(function ()
    particles:newParticle("minecraft:explosion", player:getPos())
    sounds:playSound("minecraft:block.large_amethyst_bud.break", player:getPos(),1,0.4)
    sounds:playSound("minecraft:block.amethyst_block.break", player:getPos(),1,0.6)
end)

local page = action_wheel:newPage()
action_wheel:setPage(page)

page:newAction():title("Armor Toggle"):item("minecraft:iron_chestplate").leftClick = function ()
    if armor == false then
        vanilla_model.ARMOR:setVisible(true)
        sounds:playSound("minecraft:item.armor.equip_iron", player:getPos())
        armor = true
    else 
        vanilla_model.ARMOR:setVisible(false)
        sounds:playSound("minecraft:entity.item.break",player:getPos())
        armor = false
    end
end

page:newAction():title("Screech"):item("minecraft:purple_stained_glass").leftClick = function ()
    
end