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
    -- animations.model.animation:play()
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
    sounds:playSound("minecraft:entity.ghast.warn",player:getPos(),1,3)
end

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

squapi.ear:new(
    models.model.root.Head.Ears.EarL, --leftEar
    models.model.root.Head.Ears.EarR, --(nil) rightEar
    .3, --(1) rangeMultiplier
    nil, --(false) horizontalEars
    1, --(2) bendStrength
    nil, --(true) doEarFlick
    nil, --(400) earFlickChance
    nil, --(0.1) earStiffness
    nil  --(0.8) earBounce
)

squapi.ear:new(
    models.model.root.Head.Ears.hEarL, --leftEar
    models.model.root.Head.Ears.hEarR, --(nil) rightEar
    .3, --(1) rangeMultiplier
    true, --(false) horizontalEars
    2, --(2) bendStrength
    false, --(true) doEarFlick
    nil, --(400) earFlickChance
    nil, --(0.1) earStiffness
    nil  --(0.8) earBounce
)

squapi.eye:new(
    models.model.root.Head.Eyes.eyeL,  --the eye element 
    .55,  --(0.25) left distance
    .55,  --(1.25) right distance
    .2,  --(0.5) up distance
    .7   --(0.5) down distance
)

squapi.eye:new(
    models.model.root.Head.Eyes.eyeR,  --the eye element 
    .55,  --(0.25) left distance
    .55,  --(1.25) right distance
    .2,  --(0.5) up distance
    .7   --(0.5) down distance
)

myTail = {
	models.model.root.Body.bone,
	models.model.root.Body.bone.bone2,
	models.model.root.Body.bone.bone2.bone3
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


local NVGs = models.model.root.Head.NVGs


local validHelmets = {
["minecraft:iron_helmet"] = true,
["minecraft:diamond_helmet"] = true,
["minecraft:netherite_helmet"] = true,
["minecraft:golden_helmet"] = true,
["minecraft:leather_helmet"] = true,
["minecraft:chainmail_helmet"] = true
}

events.TICK:register(function ()
local helmet = player:getItem(6)

if helmet and validHelmets[helmet.id] then
    NVGs:setVisible(true)
else
    NVGs:setVisible(false)
end
end)

local NVGs2 = models.model.ItemNVGs

events.ITEM_RENDER:register(function (item)
    if validHelmets[item.id] then
        return NVGs2
    end

end)

local Gear = {
    ["minecraft:leather_chestplate"] = true,
    ["minecraft:chainmail_chestplate"] = true,
    ["minecraft:golden_chestplate"] = true,
    ["minecraft:iron_chestplate"] = true,
    ["minecraft:diamond_chestplate"] = true,
    ["minecraft:netherite_chestplate"] = true
}



local backpack = models.model.root.Body.Backpack
local belt = models.model.root.Body.Belt
local strap = models.model.root.Body.strap   
local gloveL = models.model.root.LeftArm.cube
local gloveR = models.model.root.RightArm.cube

local skinGearParts = {
    backpack,
    belt,
    strap,
    gloveL,
    gloveR
}

events.tick:register(function()
    local chestplate = player:getItem(5)

    local isVisible = false
    if chestplate and Gear[chestplate.id] then
        isVisible = true
    end
        
    for _, part in ipairs(skinGearParts) do
        if part then
            part:setVisible(isVisible)
        end
    end
end)

events.ITEM_RENDER:register(function (item)
    if Gear[item.id] then
        return models.model.ItemBackpack
    end

end)

local inventoryOpen = false
local paper = models.model.root.RightArm.inventory
local invStart = animations.model.inventoryStart
local invLoop = animations.model.inventoryLoop
local invEnd = animations.model.inventoryEnd


-- snipet from @manuel_2867

do
  local s = {}
  function pings.sync(n,v)
    if host:isHost() then return end
    s[n] = v
  end
  local function get(x)
    if type(x) == "function" then return x() else return x end
  end
  --- Sync host-only value and return it on both host and non-hosts
  ---@param name string A unique name for your variable
  ---@param value any|fun():any A host-only value or function
  ---@param default any|nil Default value to use if there is no value synced yet
  ---@return any Returns the synced value
  function synced(name, value, default)
    if host:isHost() then
      s[name] = s[name] or {}
      s[name].g = value
      local r = get(value)
      return r ~= nil and r or default
    else
      return s[name] ~= nil and s[name] or default
    end
  end
  if host:isHost() then
    local t,k,x,l = 0
    function events.tick()
      l = 0
      for n,v in pairs(s) do
        local c = get(v.g)
        if v.p ~= c then
            pings.sync(n,c)
        end
        v.p = c
        l = l + 1
      end
      t = t + 1
      if t % math.max(10,math.ceil(200/l)) ~= 0 then return end
      k,x = next(s,k)
      if not x then return end
      pings.sync(k,get(x.g))
    end
  end
end


do
    local s = {}
    --- Check if the variable has changed since last time
    ---@param name string A unique name for your variable
    ---@param value any|fun():any A value, or a function that returns the value, which should get checked for a change
    ---@return boolean Returns whether or not the value has changed since last time
    function changed(name, value)
        local c = value
        if type(c) == "function" then c = c() end
        local r = s[name] ~= c
        s[name] = c
        return r
    end
end


-- snippet end

local inventory = models.model.root.RightArm.inventory

events.tick:register(function ()
    local isInInventory = synced("inInv", host:getScreen() == "net.minecraft.class_490")
    local outOfInventory = synced("outInv", host:getScreen() ~= "net.minecraft.class_490")

    if changed("inInv", isInInventory) then
        inventory:setVisible(true)
        invLoop:play()
    else if(host:getScreen() ~= "net.minecraft.class_490" and invLoop:isPlaying()) then
            invLoop:stop()
            invEnd:play()
            inventory:setVisible(false)
        end
    end
end)