config = modlib.conf.import(
    "dash",
    {
        type = "table",
        children = {
            polynomial = {
                type = "table",
                keys = {
                    type = "number"
                },
                values = {
                    type = "number"
                }
            },
            effects = {
                type = "table",
                keys = {
                    type = "string",
                    possible_values = {speed = true, jump = true, gravity = true}
                },
                values = {
                    type = "number",
                    range = {-10, 10}
                }
            },
            dashing = {
                type = "number",
                range = {0, 10}
            },
            charging = {
                type = "number",
                range = {0, 10}
            },
            hold = {
                type = "boolean"
            }
        }
    }
)
modlib.table.add_all(getfenv(1), config)

players = {}
dashing_timers = {}

can_dash = -1
dashing_state = 0
charging_state = -2

function polynomial_from_table(pol)
    return function(x)
        local r = 0
        local b = x
        for p, c in ipairs(pol) do
            r = r + c * b
            b = b * x
        end
        return r
    end
end
dash_function = polynomial_from_table(polynomial)

minetest.register_on_joinplayer(
    function(player)
        players[player:get_player_name()] = can_dash
    end
)

minetest.register_on_leaveplayer(
    function(player)
        players[player:get_player_name()] = nil
    end
)

function charging_complete(name)
    players[name] = can_dash
end

function dash_effects_dir(dir)
    return function(name, intensity)
        local player = minetest.get_player_by_name(name)
        local physics = player:get_physics_override()
        for effect, factor in pairs(effects) do
            physics[effect] = dir(physics[effect], factor * intensity)
        end
        player:set_physics_override(physics)
    end
end

dash_effects =
    dash_effects_dir(
    function(a, b)
        return a + b
    end
)
dash_effects_reverse =
    dash_effects_dir(
    function(a, b)
        return a - b
    end
)

color = "FFBF00"

minetest.register_globalstep(
    function(dtime)
        for player, state in pairs(players) do
            local aux1 = minetest.get_player_by_name(player):get_player_control().aux1
            if state >= dashing_state then
                local previous = dash_function(state)
                dash_effects_reverse(player, previous)
                state = state + dtime
                if state >= dashing or hold ~= aux1 then
                    state = charging_state
                    hud_timers.remove_timer_by_reference(player, dashing_timers[player])
                    hud_timers.add_timer(
                        player,
                        {
                            name = "Charging",
                            duration = charging,
                            color = color,
                            on_complete = charging_complete
                        }
                    )
                else
                    local next = dash_function(state)
                    dash_effects(player, next)
                end
                players[player] = state
            elseif state == can_dash and aux1 then
                players[player] = dashing_state -- start dashing
                local timer = hud_timers.add_timer(
                    player,
                    {
                        name = "Dashing",
                        duration = dashing,
                        color = color
                    }
                )
                dashing_timers[player] = timer
            end
        end
    end
)
