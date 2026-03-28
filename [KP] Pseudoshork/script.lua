-- Auto generated script file --

--hide vanilla model
vanilla_model.PLAYER:setVisible(false)
vanilla_model.ARMOR:setVisible(false)

events.ENTITY_INIT:register(function ()
    particles:newParticle("minecraft:explosion", player:getPos())
    sounds:playSound("minecraft:block.large_amethyst_bud.break", player:getPos(),1,0.4)
    sounds:playSound("minecraft:block.amethyst_block.break", player:getPos(),1,0.6)
end)

local squapi = require("SquAPI")

squapi.smoothHead:new(
    {
        models.model.root.Head --element(you can have multiple elements in a table)
    },
		nil,    --(1) strength(you can make this a table too)
    nil,    --(0.1) tilt
    nil,    --(1) speed
    nil,    --(true) keepOriginalHeadPos
    nil,     --(true) fixPortrait
    nil,     --(nil) animStraightenList
    nil,     --(0.5) straightenMultiplier
    nil,     --(0.5) straightenSpeed
    nil      --(0.1) blendToConsiderStopped
)


myTail = {
	models.model.root.Body.Tail,
    models.model.root.Body.Tail.bone3,
    models.model.root.Body.Tail.bone3.bone,
    models.model.root.Body.Tail.bone3.bone2
}

squapi.tail:new(myTail,
    nil,    --(15) idleXMovement
    nil,    --(5) idleYMovement
    nil,    --(1.2) idleXSpeed
    nil,    --(2) idleYSpeed
    1.5,    --(2) bendStrength
    nil,    --(0) velocityPush
    nil,    --(0) initialMovementOffset
    nil,    --(1) offsetBetweenSegments
    nil,    --(.005) stiffness
    nil,    --(.9) bounce
    nil,    --(90) flyingOffset
    nil,    --(-90) downLimit
    nil     --(45) upLimit
)

function events.item_render(item)
    if item:getName() == "chud" then
        return models.model.ItemFalseGift
    end
end