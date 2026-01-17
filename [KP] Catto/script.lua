-- Auto generated script file --

--hide vanilla model
vanilla_model.PLAYER:setVisible(false)

local squapi = require("SquAPI")

local SwingingPhysics = require("swinging_physics")
local swingOnHead = SwingingPhysics.swingOnHead
local swingOnBody = SwingingPhysics.swingOnBody

swingOnHead(models.model.root.Head.hairLong.hairSwing, 180, {-90,20,-30,30,-10,10})

squapi.ear:new(
    models.model.root.Head.ear, --leftEar
    models.model.root.Head.ear2, --(nil) rightEar
    nil, --(1) rangeMultiplier
    nil, --(false) horizontalEars
    1, --(2) bendStrength
    nil, --(true) doEarFlick
    nil, --(400) earFlickChance
    nil, --(0.1) earStiffness
    nil  --(0.8) earBounce
)

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

squapi.eye:new(
    models.model.root.Head.eyes.eyeL,  --the eye element 
    .85,  --(0.25) left distance
    .55,  --(1.25) right distance
    .2,  --(0.5) up distance
    .7   --(0.5) down distance
)


squapi.eye:new(
    models.model.root.Head.eyes.eyeR,  --the eye element 
    .55,  --(0.25) left distance
    .85,  --(1.25) right distance
    .2,  --(0.5) up distance
    .7   --(0.5) down distance
)

squapi.eye:new(
    models.model.root.Head.eyes.Eyelid,  --the eye element 
    0,  --(0.25) left distance
    0,  --(1.25) right distance
    .2,  --(0.5) up distance
    .7   --(0.5) down distance
)


myTail = {
	models.model.root.Body.Tail,
	models.model.root.Body.Tail.seg,
	models.model.root.Body.Tail.seg.seg2,
	models.model.root.Body.Tail.seg.seg2.seg3    
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

-- Doing the fucking thing iklhhhh forgot the name but like the cool wheel with stuff

local mainPage = action_wheel:newPage()
action_wheel:setPage(mainPage)

local hairChange = mainPage:newAction()
    :title("Hair toggle")
    :item("minecraft:shears")
    :hoverColor(10,5,0)
    :onLeftClick(function()
        if(models.model.root.Head.hairLong:getVisible())
        then
            sounds:playSound("entity.sheep.shear", player:getPos(), 1, 1, false)
            models.model.root.Head.hairLong:setVisible(false)
        else
            sounds:playSound("block.composter.fill_success", player:getPos(), 1, 1, false)
            models.model.root.Head.hairLong:setVisible(true)
    end
end)

local hairChange = mainPage:newAction()
    :title("Meow")
    :item("minecraft:orange_wool")
    :hoverColor(10,5,0)
    :onLeftClick(function()
        local list = {"entity.cat.purreow","entity.cat.purr","entity.cat.ambient"}
        local table_length = #list
        local random_index = math.random(1, table_length)
        local cattenoises = list[random_index]

    sounds:playSound(cattenoises, player:getPos(), 1, 1, false)
end)

local Bucket = models.model.root.Head.bucket

function events.tick()
  Bucket:setVisible(true)
end

function events.item_render(item)
    if item.id == "minecraft:bucket" then
        Bucket:setVisible(false)
    end
end
function events.item_render(item)
    if item.id == "minecraft:water_bucket" then
        Bucket:setVisible(false)
    end
end
function events.item_render(item)
    if item.id == "minecraft:lava_bucket" then
        Bucket:setVisible(false)
    end
end
function events.item_render(item)
    if item.id == "minecraft:milk_bucket" then
        Bucket:setVisible(false)
    end
end


function events.item_render(item)
    if item.id == "minecraft:bucket" then
        return models.model.ItemBucket
    end
end


function events.item_render(item)
    if item.id == "minecraft:water_bucket" then
        return models.model.ItemBucketWater
    end
end

function events.item_render(item)
    if item.id == "minecraft:lava_bucket" then
        return models.model.ItemBucketLava
    end
end

function events.item_render(item)
    if item.id == "minecraft:milk_bucket" then
        return models.model.ItemBucketMilk
    end
end