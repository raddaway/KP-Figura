-- Auto generated script file --
-- Hey! If you're reading this, thanks for downloading my model! It's perfectly if you want to modify or change it to your liking,
-- therefore, I have added comments that should help you with reading the code, even if you are a beginner!
-- Any notes that I have added will have "Rad's Note:" before them.

-- Rad's Note: Scroll all the way down if you want to frolick


--hide vanilla model  Rad's Note: If you don't add this to your model, it will not "replace" your vanilla skin, but will be overlaid on top,
-- kiiinda useful if you wanna make simple accessories for your skin!
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


-- Rad's Note: The function that "adds" Squishy API as something I can call into the file

local squapi = require("SquAPI")

-- Rad's Note: this is the API declaration that makes it possible for the antennae to swing

local SwingingPhysics = require("swinging_physics")
local swingOnHead = SwingingPhysics.swingOnHead
local swingOnBody = SwingingPhysics.swingOnBody

-- Rad's Note: The lines responsible for eye movement. The "models.model.root.Head.group6.eyeR" you see is the path to the model in Blockbench.

squapi.eye:new(
    models.model.root.Head.group6.eyeR,  --the eye element 
    .45,  --(0.25) left distance
    .55,  --(1.25) right distance
    nil,  --(0.5) up distance
    nil   --(0.5) down distance
)

squapi.eye:new(
    models.model.root.Head.group6.eyeL,  --the eye element 
    .55,  --(0.25) left distance
    .45,  --(1.25) right distance
    nil,  --(0.5) up distance
    nil   --(0.5) down distance
)

-- Rad's Note: Smooth Head

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

-- Rad's Note: Tail movement. Think of the grouping as a chain. You have the main one, root.Body.tail, that moves the tail in its entirety,
-- then, you have smaller ones - tail.group, tail.group.group2 and etc. Each subsequent one will affect the tail, making it swing better

myTail = {
	models.model.root.Body.tail,
	models.model.root.Body.tail.group,
	models.model.root.Body.tail.group.group2,
	models.model.root.Body.tail.group.group2.group3    
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
--in Blockbench, each tail segment would go inside the last. first segment would contain the second, second would contain the third, etc.
--this list can be as long as you want based on how many segments your tail is, just add more.


-- Rad's Note: Antennae swing

swingOnHead(models.model.root.Head.Antennae, 0, {-60,-20,-30,30,-10,10})
swingOnHead(models.model.root.Head.Antennae.group9, 0, {-20,20,-30,30,-10,10}, models.model.root.Head.Antennae, 1)
swingOnHead(models.model.root.Head.Antennae.group9.group10, 0, {-20,20,-30,30,-10,10}, models.model.root.Head.Antennae, 2)


swingOnHead(models.model.root.Head.Antennae2, 0, {-60,-20,-30,30,-10,10})
swingOnHead(models.model.root.Head.Antennae2.group11, 0, {-20,20,-30,30,-10,10}, models.model.root.Head.Antennae2, 1)
swingOnHead(models.model.root.Head.Antennae2.group11.group12, 0, {-20,20,-30,30,-10,10}, models.model.root.Head.Antennae2, 2)

-- Rad's Note: SET BOUNCE MULTIPLIER TO ANYTHING ABOVE 1 FOR PURE WHIMSY!!

squapi.bounceWalk:new(
    models.model,    --model
    0     -- bounceMultiplier
)