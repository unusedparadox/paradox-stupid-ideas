return {
    descriptions = {
        Back = {
            b_para_hundreddeck = {
		        name = 'Deck of Hundreds',
		        text = {
			        '+#1# {C:attention}Joker{} slots',
			        'Start with an extra {C:money}$#2#{}',
			        '{C:blue}+#3#{} hands',
			        '{C:red}+#4#{} discards',
			        '{C:attention}+#5#{} consumable slots',
			        '{C:attention}+#6#{} hand size',
                    'Beat {C:attention}#7#{} more Antes to win',
			        '{C:inactive,s:0.8}100 times stronger than other decks!{}'
                }
		    },
            b_para_naneinfdeck = {
                name = "Naneinf Deck",
                text = {
                    "Start with an",
                    "{C:attention,T:m_eternal}Eternal{} {C:dark_edition,T:e_negative}Negative{} {C:rare,T:j_baron}Baron{} and",
                    "an {C:attention}Eternal {C:dark_edition}Negative {C:uncommon,T:j_mime}Mime",
                    "All cards in deck are",
                    "{C:attention,T:m_steel}Steel{} {C:red,T:Red}Red Seal{} {C:attention}Kings",
                    "Win at Ante {C:attention}#1#"
                },
                unlock = {
                    "In one hand,",
                    "earn at least",
                    "{C:attention}1.8e308{} chips"
                }
            },
            b_para_yurideck = {
                name = "Yuri Deck",
                text = {
                    "Start with an",
                    "{C:attention,T:m_eternal}Eternal{} {C:rare,T:j_blueprint}Blueprint{} and",
                    "an {C:attention}Eternal{} {C:rare,T:j_brainstorm}Brainstorm",
                    "{C:red}#1#{} Joker slot",
                    "{C:red}#2#{} hand",
                    "{C:inactive,s:0.8}Art credit to",
                    "{C:inactive,s:0.8}@silly_goober_0nthewall on Discord"
                }
            },
            b_para_yaoideck = {
                name = "Yaoi Deck",
                text = {
                    "Start with an",
                    "{C:attention,T:m_eternal}Eternal{} {C:rare,T:j_para_fakemadness}Madness{} and",
                    "an {C:attention}Eternal{} {C:rare,T:j_vagabond}Vagabond",
                    "{C:red}#1#{} Joker slot",
                    "{C:red}#2#{} hand",
                    "{C:inactive,s:0.8}Art credit to",
                    "{C:inactive,s:0.8}@mr.cr33ps on Discord"
                }
            },
            b_para_bonniedeck = {
                name = "Bonnie Deck",
                text = {
                    "Start with an {C:attention,T:m_eternal}Eternal{} {C:uncommon,T:j_para_bonnie}Bonnie{}",
                    "and #1# random {C:attention}Food Jokers"
                }
            },
            b_para_artisticdeck = {
                name = "Artistic Deck",
                text = {
                    "{C:red}#1#{} Joker slots",
                    '{C:attention}+#2#{} hand size'
                },
                unlock = {
                    'Win with {C:attention}#1#{}',
                    'on at least',
                    '{C:gold}Gold Stake{} difficulty'
                }
            },
            b_para_voiddeck = {
                name = "Void Deck",
                text = {
                    "{C:attention}+#1#{} Joker slots",
                    '{C:red}#2#{} hands each round',
                    "{C:inactive,s:0.8}Art credit to",
                    "{C:inactive,s:0.8}@silly_goober_0nthewall on Discord"
                },
                unlock = {
                    'Win with {C:attention}#1#{}',
                    'on at least',
                    '{C:gold}Gold Stake{} difficulty'
                }
            },
            b_para_chasmdeck = {
                name = "Chasm Deck",
                text = {
                    "{C:red}#1#{} Joker slots",
                    '{C:red}#2#{} hands each round',
                    '{C:attention}+#3#{} hand size',
                    "{C:inactive,s:0.8}Art credit to",
                    "{C:inactive,s:0.8}@silly_goober_0nthewall on Discord"
                },
                unlock = {
                    'Win with {C:attention}#1#{}',
                    'and {C:attention}#2#',
                    'on at least',
                    '{C:gold}Gold Stake{} difficulty'
                }
            }
        },
        Blind = {
            bl_para_plain = {
                name = "The Plain",
                text = {
                    "All enhanced cards",
                    "are debuffed"
                }
            },
            bl_para_singular = {
                name = "The Singular",
                text = {
                    "Non-unique Jokers,",
                    "Blueprint, and",
                    "Brainstorm, are",
                    "debuffed"
                }
            }
        },
        Edition = {},
        Enhanced = {},
        Joker = {
            j_para_fakemadness = {
                name = "Madness",
                text = {
                    "When {C:attention}Small Blind{} or {C:attention}Big Blind{}",
                    "is selected, gain {X:mult,C:white}X0.5{} Mult",
                    "and {C:attention}destroy{} a random Joker",
                    "{C:inactive}(Currently {X:mult,C:white}X1{C:inactive} Mult)",
                },
            },
            j_para_bonnie = {
		        name = 'Bonnie',
		        text = {
			        'When exiting the {C:attention}shop{}',
			        'after defeating a {C:attention}Boss Blind{},',
			        'open a {C:enhanced}Snack Pack{}',
			        '{C:inactive,s:0.8}I\'m a chef cooker!!!'
		        }
            },
            j_para_bluecard = {
                name = 'Blue Card',
		        text = {
			        'This Joker gains {C:chips}+#1#{} Chips',
			        'when any {C:attention}Booster Pack{} is opened.',
			        '{C:inactive}(Currently {}{C:chips}+#2#{} {C:inactive}Chips){}',
                    '{C:inactive,s:0.8}I\'m blue, da ba dee da ba die,',
                    '{C:inactive,s:0.8}da ba dee da ba die, da ba dee da ba die.'
		        }
            },
            j_para_orangecard = {
		        name = 'Orange Card',
		        text = {
			        'This Joker gains {X:mult,C:white}X#1#{} Mult',
			        'when any {C:attention}Booster Pack{} is skipped.',
			        '{C:red}Works once per shop{}',
			        '{C:inactive}(Currently {}{X:mult,C:white}X#2#{} {C:inactive}Mult and #3#){}',
		        }
            },
            j_para_yellowcard = {
		        name = 'Yellow Card',
		        text = {
			        'Earn {C:money}$#1#{} at end of round. ',
			        'Payout increases by {C:money}$#2#{} every',
			        '#3# {C:inactive}(#4#){} {C:attention}Booster Pack{} skipped.',
		        }
            },
            j_para_pineapple = {
                name = 'Pineapple',
                text = {
                    '{X:mult,C:white}X#1#{} Mult',
                    '{C:inactive,s:0.8}Don\'t eat pineapples!',
                    '{C:inactive,s:0.8}You\'re allergic.'
                }
            },
            j_para_cookie = {
                name = 'Cookie',
                text = {
                    '{X:mult,C:white}X#1#{} Mult',
                    'For each round played, lose {X:mult,C:white}X#2#{} Mult',
                    '{C:inactive,s:0.8}Boring but delicious. Cookies, the taste of home.'
                }
            },
            j_para_plantainchips = {
                name = 'Plantain Chips',
                text = {
                    '{X:chips,C:white}X#1#{} Chips',
                    'For each round played, lose {X:chips,C:white}X#2#{} Chips',
                    '{C:inactive,s:0.8}Crunchy. Delicious. And full of potassium.',
                    '{C:inactive,s:0.8}That\'s plantain chips!!!'
                }
            },
            j_para_onigiri = {
                name = 'Onigiri',
                text = {
                    'Gives either {C:chips}+#1#{} Chips, {C:mult}+#2#{} Mult, or {X:mult,C:white}X#3#{} Mult',
                    'Disappears in {C:attention}#4#{} hands',
                    '{C:inactive,s:0.8}The onigiri have various fruits inside them.'
                }
            },
            j_para_fishhead = {
                name = "Fish Head",
                text = {
                    "Earn {C:money}$#1#{} at the end of the round",
                    "For each {C:money}$1{} you have over {C:money}$#2#{} when leaving",
                    "the shop, this Joker permanently earns {C:money}$1{} less",
                    "{C:inactive,s:0.8}Fish heads are yummy and the",
                    "{C:inactive,s:0.8}textures are different and good!!!"
                }
            },
            j_para_nft = {
                name = 'Joker NFT.png',
		        text = {
                    'Drop sell value by',
                    "{C:money}$#1#{} every round",
                    "{C:inactive}(Minimum of {C:money}$#2#{C:inactive})",
                    "{C:inactive,s:0.8}L"
                }
            },
            j_para_deltarunetomorrow = {
                name = "Jokerrune",
                text = {
                    "{X:mult,C:white}X#1#{} Mult per chapter of",
                    "{C:attention}Deltarune{} released",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
                    '{C:inactive,s:0.8}Deltarune tomorrow fr fr'
                }
            },
            j_para_madeline = {
                name = "Madeline",
                text = {
                    "On the next {C:attention}#2#{} cards",
                    "triggered, {C:mult}+#1#{} Mult",
                    "{C:inactive,s:0.8}Art credit to{}",
                    "{C:inactive,s:0.8}@secun on Discord"
                }
            },
            j_para_burntsamosas = {
                name = "Burnt Samosas",
                text = {
                    "{C:chips}+#1#{} Chips",
                    "At the end of the round, this",
                    "Joker loses {C:chips}-#2#{} Chips",
                    "{C:inactive,s:0.8}Leftovers.{}"
                }
            },
            j_para_palmier = {
                name = "Palmiers",
                text = {
                    "{C:chips}+#1#{} Chips",
                    "Every time a playing card is",
                    "triggered, that card will",
                    "permanently take {C:chips}+#2#{} Chips",
                    "from this Joker for itself",
                    "{C:inactive,s:0.8}They're yummy, they're{}",
                    "{C:inactive,s:0.8}crunchy, they get crumbs{}",
                    "{C:inactive,s:0.8}everywhere, MOVING ON!{}"
                }
            },
            j_para_malangafritter = {
                name = "Malanga Fritters",
                text = {
                    "For the next {C:attention}#1#{} hands,",
                    "first played card becomes {C:dark_edition}Negative{}.",
                    "{C:inactive}(First played card must have no{}",
                    "{C:inactive}edition for Joker to trigger){}",
                    "{C:inactive,s:0.8}You just feel like they're missing{}",
                    "{C:inactive,s:0.8}some spicy peppers for some reason.{}",
                }
            }, --[[
            j_para_noikoneshot = {
                name = "The Noik (from OneShot)",
                text = {
                    "{X:mult,C:white}X#1#{} Mult",
                    "If you would normally lose",
                    "the run, {C:red}lose the run{}",
                    "After the run is won,",
                    "{C:red}lose the run{}",
                    "{C:inactive,s:0.8}You only have one sho- wait,{}",
                    "{C:inactive,s:0.8}this is a roguelike?{}",
                }
            } ]]--
            j_para_airplane = {
                name = "Airplane",
                text = {
                    "For each purchased {C:attention}Tier 1{} Voucher,",
                    "gain {C:attention}#1#{} free {C:green}reroll{} per shop",
                    "{C:inactive}#3#{C:attention}#2#{C:inactive}#4#",
                    "{C:inactive,s:0.8}Art credit to",
                    "{C:inactive,s:0.8}@silly_goober_0nthewall on Discord"
                }
            },
            j_para_tower = {
                name = "Tower",
                text = {
                    "Earn {C:money}$#1#{} at end of round",
                    "if you have at least two {C:attention}Towers",
                    "Duplicate {C:attention}Towers{} can appear",
                    "without {C:attention}Showman",
                    "{C:inactive,s:0.8}oh boy i sure hope nobody",
                    "{C:inactive,s:0.8}crashes an airplane into me"
                }
            },
            j_para_astro = {
                name = "< Astro >w< >", -- < • Astro >⩊< • >, balala cant render the dot or the omega
                text = {
                    "{X:dark_edition,C:white}^^#1#{} Chips if played hand is a {C:attention}Flush",
                    "Gains {X:dark_edition,C:white}^^#2#{} Chips for each scoring {C:spades}Spade",
                    "Awakens a {C:attention}great power{} in another Joker",
                    "{C:inactive,s:0.8}Art credit to",
                    "{C:inactive,s:0.8}@silly_goober_0nthewall on Discord"
                }
            },
            j_para_green_credit_card = {
                name = 'Green Credit Card',
                text = {
                    "Go {C:attention}as much{} in debt {C:attention}as you want",
                    "{C:inactive,s:0.8}This will have no unforseen consequences."
                }
            },
            j_para_card = {
                name = 'card',
                text = {
                    "{C:chips}+1{} chip",
                    "{C:inactive,s:0.8}Cards together strong"
                }
            },
        },
        Other = {
            p_para_foodpack = {
		        name = 'Snack Pack',
		        text = {
			        'Choose 1 of 3 {C:attention}Food Jokers'
		        },
	        	group_name = '(You\'d like...)'
            },
            p_para_creditpack = {
		        name = 'Credit Card',
		        text = {
			        'Choose 1 {C:attention}Credit Card'
		        },
	        	group_name = 'Credit Card'
            }
        },
        Planet = {},
        Spectral = {},
        Stake = {},
        Tag = {
            tag_para_foodtag = {
                name = 'Safe Room Tag',
                text = {
                    'Open a free {C:enhanced}Snack Pack{}'
                }
            }
        },
        Tarot = {},
        Voucher = {},
    },
    misc = {
        achievement_descriptions = {
            ach_para_deathbypineapple = 'Snack on some pineapple slices.',
            ach_para_nineelevenplus = "Purchase an airplane while holding a certain Joker on a specific date."
        },
        achievement_names = {
            ach_para_deathbypineapple = 'Best idea you\'ve ever had!',
            ach_para_nineelevenplus = "Don't you dare."
        },
        blind_states = {},
        challenge_names = {
            c_para_endurance = "Endurance Test",
            c_para_easy = "Easy...?"
        },
        collabs = {},
        dictionary = {
            groupfoodpack = "(You'd like...)",
            groupcreditpack = "Credit Card",
            para_k_reactivated = "Reactivated!",
            para_k_upgrade = "Upgrade!",
            para_k_active = "Active",
            para_k_inactive = "Inactive",
            para_k_l = "L",
            para_k_snacktime = 'Snacks time!',
            para_k_chips = " Chips",
            para_k_transformed = "Transformed!",
            para_k_watercooled = "Water cooled!",
            k_para_mythic = "Mythic",
            k_para_nft = "NFT",
            airplane_a1 = "(Currently ",
            airplane_a2 = "(Currently ",
            airplane_b1 = " free reroll)",
            airplane_b2 = " free rerolls)"
        },
        high_scores = {},
        labels = {
            k_para_mythic = "Mythic",
            k_para_nft = "NFT"
        },
        poker_hand_descriptions = {},
        poker_hands = {},
        quips = {
            pineapple = {
                "You're allergic to",
                "pineapples, stardust!"
            }
        },
        ranks = {},
        suits_plural = {},
        suits_singular = {},
        tutorial = {},
        v_dictionary = {
            powpow_chips = {"^^#1# Chips"},
        },
        v_text = {},
    },
}