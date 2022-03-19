local squig_data = {
    detection_radius = 10,
	panic_close_detection_radius_sq = 9,
	target_selection = "pick_closest_target_with_spillover",
	run_speed = 4.5,
	exchange_order = 1,
    leave_walk_distance = 1,
    enter_walk_distance = 0.1,
    hit_mass_count = 1,
    smart_targeting_width = 0.1,
    smart_targeting_outer_width = 0.5,
    passive_walk_speed = 2,
	horde_behavior = "horde_rat",
    use_backstab_vo = true,
    smart_object_template = "default_clan_rat",
    patrol_passive_target_selection = "patrol_passive_target_selection",
    patrol_detection_radius = 10,
	flingable = false,
	has_inventory = true,
	perception = "perception_regular",
	not_bot_target = true,
	animation_sync_rpc = "rpc_sync_anim_state_7",
	aoe_radius = 0.1,
	poison_resistance = 70,
	debug_spawn_category = "Misc",
	aoe_height = 0.1,
	--cannot_far_path = true,
	walk_speed = 3,
	hit_reaction = "ai_default",
	bone_lod_level = 1,
	hit_effect_template = "HitEffectsCritterRat",
	radius = 1,
	--unit_template = "ai_unit_critter",
    unit_template = "ai_unit_clan_rat",
	perception_previous_attacker_stickyness_value = -12.5,
    player_locomotion_constrain_radius = 0.7,
	race = "skaven",
	no_autoaim = true,
	death_reaction = "ai_default",
	armor_category = 1,
	weapon_reach = 2,
	vortexable = false,
	--disable_local_hit_reactions = true,
	--behavior = "slave_rat",
    behavior = "greenskin_squig",
    base_unit = "units/squig_herd/grn_squig_herd_01",
	threat_value = 1,
	--ignore_activate_unit = true,
    slot_template = "skaven_horde",
    default_inventory_template = {'squig'},
	opt_default_inventory_template = {'squig'},
	size_variation_range = {
		0.95,
		1.05
	},
	animation_merge_options = {
		idle_animation_merge_options = {},
		move_animation_merge_options = {}
	},
	hitzone_multiplier_types = {},
	hit_zones = {
        neck = {
            prio = 1,
            actors = {
                "c_head"
               
            }
        },
        torso = {
            prio = 2,
            actors = {
                "c_head"
            },
            push_actors = {
                "head_0"
            }
        },
        full = {
            prio = 3,
            actors = {}
        }
    },
	max_health = {
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1
	},
	num_push_anims = {
		push_backward = 4
	},
	debug_color = {
		255,
		40,
		90,
		170
	},
	allowed_layers = {
		planks = 1.5,
		bot_ratling_gun_fire = 5,
		doors = 1.5,
		destructible_wall = 0,
		bot_poison_wind = 5,
		temporary_wall = 0,
		fire_grenade = 5
	}
}

Breeds.greenskin_squig = table.create_copy(Breeds.greenskin_squig, squig_data)

BreedActions.greenskin_squig = {
	alerted = {
		cooldown = -1,
		action_weight = 1,
		start_anims_name = {
			bwd = "move_fwd",
			fwd = "move_fwd",
			left = "move_fwd",
			right = "move_fwd"
		},
		start_anims_data = {
			alerted_fwd = {},
			alerted_bwd = {
				dir = -1,
				rad = math.pi
			},
			alerted_left = {
				dir = 1,
				rad = math.pi / 2
			},
			alerted_right = {
				dir = -1,
				rad = math.pi / 2
			}
		}
	},
	flee = {
		min_far_along_path_pos_distance_sq = 100,
		considerations = UtilityConsiderations.clan_rat_follow,
		cover_point_check = {
			max_height_diff = 2,
			max_cover_point_check_dist = 25,
			min_cover_point_check_dist = 5
		},
		random_point_in_front_check = {
			max_random_point_in_front_check_dist = 15,
			below = 2,
			min_width = 1,
			max_tries = 30,
			max_width = 5,
			above = 1,
			min_random_point_in_front_check_dist = 10
		},
		random_point_check = {
			below = 2,
			max_tries = 30,
			min_random_point_check_dist = 5,
			above = 1,
			max_random_point_check_dist = 10
		},
		dig_timer = {
			max_time_before_dig = 10,
			min_time_before_dig = 5
		}
	},
    follow = {
		cooldown = -1,
		action_weight = 1,
		start_anims_name = {
			bwd = "move_start_bwd",
			fwd = "move_start_fwd",
			left = "move_start_left",
			right = "move_start_right"
		},
		start_anims_data = {
			move_start_fwd = {},
			move_start_bwd = {
				dir = -1,
				rad = math.pi
			},
			move_start_left = {
				dir = 1,
				rad = math.pi / 2
			},
			move_start_right = {
				dir = -1,
				rad = math.pi / 2
			}
		},
		considerations = UtilityConsiderations.clan_rat_follow
	},
    normal_attack = {
		damage_type = "cutting",
		damage = 3,
		player_push_speed = 3,
		attack_intensity_type = "normal",
		action_weight = 1,
		move_anim = "move_start_fwd",
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		default_attack = {
			anims = {
				"attack_pounce"
			},
			damage_box_range = {
				flat = 2,
				up = 1.7,
				down = -0.75
			}
		},
		high_attack = {
			z_threshold = 1.5,
			anims = {
				"attack_reach_up"
			},
			damage_box_range = {
				flat = 1.5,
				up = 3.8,
				down = 0
			}
		},
		mid_attack = {
			z_threshold = -0.6,
			flat_threshold = 1.5,
			anims = {
				"attack_pounce_down"
			},
			damage_box_range = {
				flat = 2,
				up = 1.7,
				down = -2
			}
		},
		low_attack = {
			z_threshold = -0.6,
			anims = {
				"attack_reach_down"
			},
			damage_box_range = {
				flat = 1,
				up = 1.7,
				down = -3
			}
		},
		knocked_down_attack = {
			z_threshold = 0.6,
			anims = {
				"attack_pounce_down"
			},
			damage_box_range = {
				flat = 1,
				up = 1.7,
				down = -3
			}
		},
		target_type_exceptions = {
			poison_well = {
				anims = "poison_well",
				damage_box_range = {
					flat = 2,
					up = 1.7,
					down = -0.75
				}
			}
		},
		difficulty_damage = BreedTweaks.difficulty_damage.skaven_horde_attack,
		considerations = UtilityConsiderations.clan_rat_attack,
		fatigue_type = BreedTweaks.fatigue_types.horde.normal_attack,
		diminishing_damage = {},
		difficulty_diminishing_damage = BreedTweaks.diminishing_damage_and_cooldown.horde,
		dodge_window_start = BreedTweaks.dodge_windows.normal_attack,
		dodge_window_duration = BreedTweaks.dodge_window_durations.normal_attack,
		attack_directions = {
			attack_pounce_down_3 = "left",
			attack_move_2 = "left",
			attack_reach_down_2 = "left",
			attack_pounce_2 = "left",
			attack_reach_up_3 = "right",
			attack_move_1 = "right",
			attack_reach_up_2 = "left",
			attack_pounce_down = "left",
			attack_move = "left",
			attack_reach_down = "left",
			attack_run = "left",
			attack_pounce_down_2 = "right",
			attack_reach_up_4 = "left",
			attack_reach_up = "left",
			attack_reach_down_3 = "right",
			attack_pounce_4 = "right",
			attack_pounce_3 = "right",
			attack_pounce = "right"
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.skaven_horde
	},
    combat_shout = {
		cooldown = -1,
		shout_anim = "shout",
		action_weight = 1,
		considerations = UtilityConsiderations.clan_rat_shout
	},
	smash_door = {
		unblockable = true,
		name = "smash_door",
		damage = 1,
		damage_type = "cutting",
		move_anim = "move_fwd",
		attack_anim = "attack_pounce"
	},
	interest_point_choose = {
		max_range = 10,
		name = "interest_point_choose",
		min_range = 4
	},
    utility_action = {
		fail_cooldown_blackboard_identifier = "attack_cooldown_at",
		name = "utility_action",
		fail_cooldown_name = "utility_fail_cooldown"
	},
    smash_door = {
		unblockable = true,
		name = "smash_door",
		damage = 1,
		damage_type = "cutting",
		move_anim = "move_fwd",
		attack_anim = "hesitate"
	},
	look_for_players = {
		anim_event = "to_combat",
		despawn_radius = 30,
		anim_length = 4,
		look_time = 2
	},
    stagger = {
		scale_animation_speeds = true,
		imation_speeds = true,
		custom_enter_function = function (unit, blackboard, t, action)
			if blackboard.stagger_type == 3 then
				blackboard.stagger_immune_time = t + 1.25
				blackboard.heavy_stagger_immune_time = t + 0.5
			elseif blackboard.stagger_type == 6 then
				blackboard.stagger_immune_time = t + 2.5
				blackboard.heavy_stagger_immune_time = t + 2
			end

			local stagger_anims = action.stagger_anims[blackboard.stagger_type]

			return stagger_anims, "idle"
		end,
		stagger_anims = {
			{
				fwd = {
					"stun_bwd_sword"
				},
				bwd = {
					"stun_fwd_sword"
				},
				left = {
					"stun_left_sword",
					"stun_left_sword_2",
					"stun_left_sword_3"
				},
				right = {
					"stun_right_sword",
					"stun_right_sword_2",
					"stun_right_sword_3"
				},
				dwn = {
					"stun_down"
				}
			},
			{
				fwd = {
					"stagger_fwd",
					"stagger_fwd_2",
					"stagger_fwd_3",
					"stagger_fwd_4"
				},
				bwd = {
					"stagger_bwd",
					"stagger_bwd_2",
					"stagger_bwd_3",
					"stagger_bwd_4",
					"stagger_bwd_5"
				},
				left = {
					"stagger_left",
					"stagger_left_2",
					"stagger_left_3",
					"stagger_left_4"
				},
				right = {
					"stagger_right",
					"stagger_right_2",
					"stagger_right_3",
					"stagger_right_4"
				},
				dwn = {
					"stun_down"
				}
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd_fall",
					"stagger_bwd_fall_2",
					"stagger_bwd_heavy",
					"stagger_bwd_heavy_2",
					"stagger_bwd_heavy_3",
					"stagger_bwd_heavy_4"
				},
				left = {
					"stagger_left_heavy",
					"stagger_left_heavy_2",
					"stagger_left_heavy_3",
					"stagger_left_heavy_4",
					"stagger_left_heavy_5"
				},
				right = {
					"stagger_right_heavy",
					"stagger_right_heavy_2",
					"stagger_right_heavy_3",
					"stagger_right_heavy_4",
					"stagger_right_heavy_5"
				},
				dwn = {
					"stun_down"
				}
			},
			{
				fwd = {
					"stun_fwd_ranged_light",
					"stun_fwd_ranged_light_2"
				},
				bwd = {
					"stun_bwd_ranged_light",
					"stun_bwd_ranged_light_2"
				},
				left = {
					"stun_left_ranged_light",
					"stun_left_ranged_light_2"
				},
				right = {
					"stun_right_ranged_light",
					"stun_right_ranged_light_2"
				}
			},
			{
				fwd = {
					"stagger_fwd_stab"
				},
				bwd = {
					"stagger_bwd_stab",
					"stagger_bwd_stab_2"
				},
				left = {
					"stagger_left_stab"
				},
				right = {
					"stagger_right_stab"
				}
			},
			{
				fwd = {
					"stagger_fwd_exp",
					"stagger_fwd_exp_2"
				},
				bwd = {
					"stagger_bwd_exp",
					"stagger_bwd_exp_2"
				},
				left = {
					"stagger_left_exp",
					"stagger_left_exp_2"
				},
				right = {
					"stagger_right_exp",
					"stagger_right_exp_2"
				}
			},
			{
				fwd = {
					"stagger_short_fwd",
					"stagger_short_fwd_2"
				},
				bwd = {
					"stagger_short_bwd",
					"stagger_short_bwd_2",
					"stagger_short_bwd_3",
					"stagger_short_bwd_4",
					"stagger_short_bwd_5"
				},
				left = {
					"stun_left_sword",
					"stun_left_sword_2",
					"stun_left_sword_3",
					"stagger_short_left",
					"stagger_short_left_2"
				},
				right = {
					"stun_right_sword",
					"stun_right_sword_2",
					"stun_right_sword_3",
					"stagger_short_right",
					"stagger_short_right_2"
				},
				dwn = {
					"stun_down"
				}
			},
			{
				fwd = {},
				bwd = {},
				left = {},
				right = {}
			},
			{
				fwd = {
					"stagger_fwd_exp",
					"stagger_fwd_exp_2"
				},
				bwd = {
					"stagger_bwd_fall",
					"stagger_bwd_fall_2",
					"stagger_bwd_heavy",
					"stagger_bwd_heavy_2",
					"stagger_bwd_heavy_3",
					"stagger_bwd_heavy_4"
				},
				left = {
					"stagger_left_heavy",
					"stagger_left_heavy_2",
					"stagger_left_heavy_3",
					"stagger_left_heavy_4",
					"stagger_left_heavy_5"
				},
				right = {
					"stagger_right_heavy",
					"stagger_right_heavy_2",
					"stagger_right_heavy_3",
					"stagger_right_heavy_4",
					"stagger_right_heavy_5"
				},
				dwn = {
					"stun_down"
				}
			}
		}
	},
	idle = {}
}

return