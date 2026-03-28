-- Auto generated script file --

vanilla_model.BODY:setVisible(false)
vanilla_model.LEFT_LEG:setVisible(false)
vanilla_model.RIGHT_LEG:setVisible(false)
vanilla_model.JACKET:setVisible(false)
vanilla_model.LEFT_SLEEVE:setVisible(false)
vanilla_model.RIGHT_SLEEVE:setVisible(false)
vanilla_model.LEFT_PANTS:setVisible(false)
vanilla_model.RIGHT_PANTS:setVisible(false)
vanilla_model.ARMOR:setVisible(false)


events.ENTITY_INIT:register(function ()
    particles:newParticle("minecraft:explosion", player:getPos())
    sounds:playSound("minecraft:block.large_amethyst_bud.break", player:getPos(),1,0.4)
    sounds:playSound("minecraft:block.amethyst_block.break", player:getPos(),1,0.6)
end)

-- Possible solution for wakeUp animation using getRot and setRot
-- Solution 2: swapping over to models.model.body:setPrimaryTexture("Skin")

events.ITEM_RENDER:register(function (item)
    if item.id == "minecraft:iron_sword" then
        return models.model.ItemCrowbar
    end
end)

events.ITEM_RENDER:register(function (item)
    if item.id == "minecraft:wooden_sword" then
        return models.model.ItemBat
    end
end)

events.ITEM_RENDER:register(function (item)
    if item.id == "minecraft:stone_sword" then
        return models.model.ItemBasher
    end
end)