
return {
    descriptions = {
        Back = {
            b_para_hundreddeck = {
		        name = 'Deck of Hundreds',
		        text = {
			        '{s:0.8}+#1# {C:attention,s:0.8}Joker{s:0.8} slots',
			        '{s:0.8}Start with an extra {C:money,s:0.8}$#2#{}',
			        '{C:blue,s:0.8}+#3#{s:0.8} hands',
			        '{C:red,s:0.8}+#4#{s:0.8} discards',
			        '{C:attention,s:0.8}+#5#{s:0.8} consumable slots',
			        '{C:attention,s:0.8}+#6#{s:0.8} hand size',
                    '{s:0.8}Beat {C:attention,s:0.8}#7#{s:0.8} more Antes to win',
                },
                unlock = {
                    "In one hand,",
                    "earn at least",
                    "{E:1,C:attention}#1#{} chips",
                },
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
                    "{C:attention,T:m_eternal}Eternal{} {C:rare,T:j_blueprint}Blueprint{} and an {C:attention}Eternal{} {C:rare,T:j_brainstorm}Brainstorm",
                    "{C:red}#1#{} Joker slot, {C:blue}#2#{} hand",
                }
            },
            b_para_yaoideck = {
                name = "Yaoi Deck",
                text = {
                    "Start with an",
                    "{C:attention,T:m_eternal}Eternal{} {C:rare,T:j_para_fakemadness}Madness{} and an {C:attention}Eternal{} {C:rare,T:j_vagabond}Vagabond",
                    "{C:red}#1#{} Joker slot, {C:blue}#2#{} hand",
                }
            },
            b_para_bonniedeck = {
                name = "Bonnie Deck",
                text = {
                    "Start with an {C:attention,T:m_eternal}Eternal{} {C:uncommon,T:j_para_bonnie}Bonnie{}",
                    "and #1# random {C:attention}Food Jokers",
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
            b_para_artisticdeck_unfiltered = {
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
            b_para_artisticdeck_upgraded = {
                name = "Artistic Deck",
                text = {
                    "{C:red}#1#{} Joker slots",
                    '{C:red}#2#{} hand size',
                    "{C:attention}+#3#{} hand size when",
                    "Boss Blind is defeated",
                    "Jokers are {C:attention}5x{} more",
                    "likely to be {C:dark_edition}Negative{}"
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
                    '{C:blue}#2#{} hands each round',
                },
                unlock = {
                    'Win with {C:attention}#1#{}',
                    'on at least',
                    '{C:gold}Gold Stake{} difficulty'
                }
            },
            b_para_voiddeck_unfiltered = {
                name = "Void Deck",
                text = {
                    "{C:attention}+#1#{} Joker slots",
                    '{C:blue}#2#{} hands each round',
                },
                unlock = {
                    'Win with {C:attention}#1#{}',
                    'on at least',
                    '{C:gold}Gold Stake{} difficulty'
                }
            },
            b_para_voiddeck_upgraded = {
                name = "Void Deck",
                text = {
                    "{s:0.8}When the Boss Blind on",
                    "{s:0.8}an even Ante is defeated,",
                    'gain {C:attention}+#1#{} Joker slot and lose {C:blue}#2#{} hand',
                    "{C:inactive}Effect will not trigger if you have 1 hand",
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
                    '{C:blue}#2#{} hands each round',
                    '{C:attention}+#3#{} hand size',
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
                    "Enhanced cards",
                    "are debuffed"
                }
            },
            bl_para_singular = {
                name = "The Singular",
                text = {
                    "Cards with the same",
                    "rank, suit and",
                    "enhancement as",
                    "another card in your",
                    "full deck are debuffed"
                }
            }
        },
        Edition = {},
        Enhanced = {
            m_para_ashen = {
                name = "Charred Card",
                text = {
                    "When this card",
                    "is played, all",
                    "scoring cards gain",
                    "{C:chips}+#1# {}chips",
                    "{C:green}#2# in #3#{} chance",
                    "to destroy card"
                }
            }
        },
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
			        'create a {C:enhanced}Safe Room Tag{}',
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
			        'Payout increases by {C:money}$#2#{} when',
			        'any {C:attention}Booster Pack{} is skipped.',
		        }
            },
            j_para_pineapple = {
                name = 'Pineapple',
                text = {
                    '{C:mult}+#1#{} Mult',
                    '{C:mult}-#2#{} Mult at end of round',
                    '{X:mult,C:white}XMult{} and {X:chips,C:white}XChips{} will not trigger',
                    '{C:inactive,s:0.8}Don\'t eat pineapples!',
                    '{C:inactive,s:0.8}You\'re allergic.'
                }
            },
            j_para_pineapple_unfiltered = {
                name = 'Pineapple',
                text = {
                    '{X:mult,C:white}X#1#{} Mult',
                    '{C:inactive,s:0.8}Don\'t eat pineapples!',
                    '{C:inactive,s:0.8}You\'re allergic.'
                }
            },
            j_para_pineapple_upgraded = {
                name = 'Pineapple',
                text = {
                    '{C:mult}+#1#{} Mult',
                    '{C:mult}-#2#{} Mult at end of round',
                    '{X:mult,C:white}XMult{} and {X:chips,C:white}XChips{} will not trigger',
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
                    '{C:chips}+#1#{} Chips',
                    'At the end of the round,',
                    '{C:green}#3# in #4#{} chance to lose {C:chips}-#2#{} Chips',
                    '{C:inactive,s:0.8}Crunchy. Delicious. And full of potassium.',
                    '{C:inactive,s:0.8}That\'s plantain chips!!!'
                }
            },
            j_para_onigiri = {
                name = 'Onigiri',
                text = {
                    'Gives either {C:chips}+#1#{} Chips, {C:mult}+#2#{} Mult, or {X:mult,C:white}X#3#{} Mult',
                    'Disappears in {C:attention}#4#{} hands',
                }
            },
            j_para_fishhead = {
                name = "Fish Head",
                text = {
                    "Earn {C:money}$#1#{} at the end of the round",
                    "For each {C:money}$1{} you have over {C:money}$#2#{} at",
                    "end of round, this Joker permanently earns {C:money}$1{} less",
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
            j_para_jokerrune = {
                name = "Jokerrune",
                text = {
                    "{X:mult,C:white}X#1#{} Mult per chapter of",
                    "{C:attention}Deltarune{} released",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
                    '{C:inactive,s:0.8}HOW MUCH LONGER NOW...',
                    '{C:inactive,s:0.8}MY DELTARUNE.'
                }
            },
            j_para_madeline = {
                name = "Madeline",
                text = {
                    "On the next {C:attention}#2#{} cards",
                    "triggered, {C:mult}+#1#{} Mult"
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
                    "triggered, this Joker loses",
                    "{C:chips}-#2#{} Chips and that card",
                    "gains {C:chips}+#2#{} Chips",
                    "{C:inactive,s:0.8}They're yummy, they're{}",
                    "{C:inactive,s:0.8}crunchy, they get crumbs{}",
                    "{C:inactive,s:0.8}everywhere, MOVING ON!{}"
                }
            },
            j_para_malangafritter = {
                name = "Malanga Fritters",
                text = {
                    "For the next {C:attention}#1#{} hands,",
                    "first played card becomes {C:dark_edition}Polychrome{}.",
                    "{C:inactive}(First played card must have no{}",
                    "{C:inactive}edition for Joker to trigger){}",
                    "{C:inactive,s:0.8}You just feel like they're missing{}",
                    "{C:inactive,s:0.8}some spicy peppers for some reason.{}",
                }
            },
            j_para_malangafritter_upgraded = {
                name = "Malanga Fritters",
                text = {
                    "For the next {C:attention}#1#{} hands,",
                    "first played card becomes {C:dark_edition}Polychrome{}.",
                    "{C:inactive}(First played card must have no{}",
                    "{C:inactive}edition for Joker to trigger){}",
                    "{C:inactive,s:0.8}You just feel like they're missing{}",
                    "{C:inactive,s:0.8}some spicy peppers for some reason.{}",
                }
            },
            j_para_malangafritter_unfiltered = {
                name = "Malanga Fritters",
                text = {
                    "For the next {C:attention}#1#{} hands,",
                    "first played card becomes {C:dark_edition}Negative{}.",
                    "{C:inactive}(First played card must have no{}",
                    "{C:inactive}edition for Joker to trigger){}",
                    "{C:inactive,s:0.8}You just feel like they're missing{}",
                    "{C:inactive,s:0.8}some spicy peppers for some reason.{}",
                }
            },
            j_para_airplane = {
                name = "Airplane",
                text = {
                    "For each purchased {C:attention}Tier 1{} Voucher,",
                    "gain {C:attention}#1#{} free {C:green}reroll{} per shop",
                    "{C:inactive}#3#{C:attention}#2#{C:inactive}#4#",
                }
            },
            j_para_tower = {
                name = "Tower",
                text = {
                    "Earn {C:money}$#1#{} at end of round",
                    "for each {C:money}$#2#{} you have",
                    "{C:inactive}(It's not capped.)"
                }
            },
            j_para_astro = {
                name = "Astro",
                text = {
                    "If played hand is a {C:attention}Flush{},",
                    "all scoring cards become {C:spades}Spades",
                    "{C:inactive}(Cards are transformed prior to scoring)"
                }
            },
            j_para_astro_unfiltered = {
                name = "< Astro >w< >", -- < • Astro >⩊< • >, balala cant render the dot or the omega
                text = {
                    {
                        "{X:dark_edition,C:white}^#1#{} Chips if played hand is a {C:attention}Flush",
                        "Gains {X:dark_edition,C:white}^#2#{} Chips for each scoring {C:spades}Spade",
                    },
                    {
                        "Used {C:planet}Planet{} cards have a {C:green}#3# in #4#{}",
                        "chance to trigger {C:attention}#5#{} additional #6#",
                        "Increase extra triggers by {C:attention}#7#",
                        "every #8# {C:inactive}(#9#){} {C:attention}9s{} scored"
                    },
                    {
                        "The {C:green}numerators{} of {C:attention}listed probabilities",
                        "are multiplied by {C:green}#10#",
                        "Increase {C:attention}probability boost{} by {C:green}#11#",
                        "when a {C:attention}Lucky Card{} is scored",
                    },
                    {
                        "{C:planet}Astro{} Jokers each give {C:white,X:chips}X#12#{} Chips",
                        "Increase {C:white,X:chips}XChips{} by {C:white,X:chips}X#13#{} if",
                        "played hand contains a {C:attention}Flush{} of {V:1}#14#",
                        "{s:0.8}Suit changes each round unrelated to deck",
                    }
                }
            },
            j_para_green_credit_card = {
                name = "Credit Card",
                text = {
                    "Go up to",
                    "{C:red}-$#1#{} in debt",
                },
            },
            j_para_green_credit_card_unfiltered = {
                name = 'Green Credit Card',
                text = {
                    "Go {C:attention}as much{} in debt {C:attention}as you want",
                    "{C:inactive,s:0.8}This will have no unforseen consequences."
                }
            },
            j_para_green_credit_card_upgraded = {
                name = "Credit Card",
                text = {
                    "Go up to",
                    "{C:red}-$#1#{} in debt",
                },
            },
            j_para_card = {
                name = 'card',
                text = {
                    "{C:chips}+#1#{} chip",
                    "{C:inactive,s:0.8}Cards together strong"
                }
            },
            j_para_pancake = {
		        name = 'Pancakes',
		        text = {
			        'Scored {C:attention}Food Jokers{} give {C:mult}+#1#{} Mult',
			        'Lose {C:mult}-#2#{} Mult at end of round',
                    '{C:inactive,s:0.8}"So you hate waffles?" No bitch. Dats a',
                    '{C:inactive,s:0.8}whole new sentence. Wtf is you talkin about.'
		        }
            },
            j_para_paradox = {
		        name = 'UnusedParadox',
		        text = {
			        'When a {C:tarot}Tarot{} card is',
			        'used, convert leftmost card',
                    'held in hand to {C:hearts}Hearts{}',
                    '{C:inactive}(Cards must be in hand to activate)',
                    '{C:inactive,s:0.8}no way thats me. woag',
		        }
            },
            j_para_paradox_unfiltered = {
		        name = 'UnusedParadox\'s OP self insert',
		        text = {
			        'When leaving shop, create a random',
			        '{C:attention}Joker{} from {B:2,V:1}Paradox\'s Stupid Ideas{}',
                    "with the {C:dark_edition}Negative{} edition",
                    '{C:inactive,s:0.8}"joker poker: balala"',
                    '{C:inactive,s:0.8}-UnusedParadox, 2025',
		        }
            },
            j_para_ashenjoker = {
                name = "Charred Joker",
                text = {
                    "This Joker gains {X:chips,C:white}X#2#{} Chips",
                    "when a {C:attention}Charred Card{} is played",
                    "{C:inactive}(Currently {X:chips,C:white}X#1#{C:inactive} Chips)"
                }
            },
            j_para_jackenstein = {
                name = "Jackenstein",
                text = {
                    "This Joker loses {X:mult,C:white}X#2#{} Mult",
                    "prior to every {C:blue}hand{} or {C:red}discard{}",
                    "Resets to {X:mult,C:white}X#3#{} Mult",
                    "at the end of the {C:attention}Ante",
                    "{C:inactive}(Minimum {X:mult,C:white}X#4#{C:inactive} Mult, currently {X:mult,C:white}X#1#{C:inactive} Mult)",
                }
            },
            j_para_castenstone = {
                name = "Casten Stone",
                text = {
                    "No played cards will score",
                    "Gains {C:chips}+#2#{} Chips per played card",
                    "any copy of {C:attention}Casten Stone{}",
                    "prevented from scoring",
                    "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
                }
            },
            j_para_brokenphone = {
                name = "Broken Phone",
                text = {
                    "Gives half the {C:mult}Mult{} and {C:chips}Chips",
                    "from {C:attention}most played{} poker hand",
                    "(Ties are broken by",
                    "highest ranked poker hand)",
                    "{C:inactive}(Currently {C:planet}#1#{C:inactive} with",
                    "{C:chips}+#2#{C:inactive} Chips and {C:mult}+#3#{C:inactive} Mult)",
                }
            },
            j_para_threepartplan = {
                name = "Three Part Plan",
                text = {
                    "Scoring cards have a {C:green}#1# in #2#{}",
                    "chance to become {C:attention}Glass Cards{}",
                    "Destroyed {C:attention}Glass Cards{} are",
                    "copied and have their",
                    "rank and suit {C:attention}randomized",
                    "(All ranks and suits have equal odds)"
                }
            },
            j_para_volcaniceruption = {
                name = "Volcanic Eruption",
                text = {
                    "No played cards will score",
                    "Gain {X:chips,C:white}X#2#{} Chips for each unscored card",
                    "{C:inactive}(Currently {X:chips,C:white}X#1#{C:inactive} Chips)"
                }
            },
            j_para_endlessinferno = {
                name = "Endless Inferno",
                text = {
                    "All scoring cards become",
                    "{C:attention}Charred Cards{} and gain {X:chips,C:white}X#1#{} Chips",
                    "{C:inactive,s:0.8}Steamodded has a minor bug",
                    "{C:inactive,s:0.8}such that cards played with this Joker",
                    "{C:inactive,s:0.8}will display \"{X:chips,C:white,s:0.8}Xnil{C:inactive,s:0.8} chips when held\".",
                    "{C:inactive,s:0.8}Rest assured, this means nothing."
                }
            },
            j_para_supercomputer = {
                name = "Supercomputer",
                text = {
                    "Gives the {C:chips}Chips{} and {C:mult}Mult{} of",
                    "most played poker hand",
                    "{C:attention}Levels up{} most played",
                    "poker hand prior to scoring",
                    "(Ties are broken by",
                    "highest ranked poker hand)",
                    "{C:inactive}(Currently {C:planet}#1#{C:inactive} with",
                    "{C:chips}+#2#{C:inactive} Chips and {C:mult}+#3#{C:inactive} Mult,",
                    "{C:inactive}gains {C:chips}+#4#{C:inactive} Chips and {C:mult}+#5#{C:inactive} Mult)"
                },
            },
            j_para_garagefork = {
                name = "Fork Found In Garage",
                text = {
                    "Cards in {C:tarot}Arcana{} and {C:planet}Celestial{}",
                    "packs have a {C:green}#1# in #2#{} chance",
                    "to be {C:spectral}Spectral{} cards",
                    "When opening a {C:planet}Celestial{} pack,",
                    "draw {C:attention}playing cards{} to hand",
                    "{C:inactive}(Does not override Telescope)",
                    "{C:inactive,s:0.8}\"fork found in garage\"",
                    "{C:inactive,s:0.8}-nxkoo_, 7/16/2025"
                },
            },
            j_para_the_plain = {
                name = "The Plain",
                text = {
                    "Played {C:attention}unenhanced{} cards",
                    "gain {C:mult}+#2#{} Mult and {C:chips}+#1#{} Chips",
                    "Played {C:attention}enhanced{} cards",
                    "have their bonus {C:mult}Mult{}",
                    "and {C:chips}Chips{} {C:red}removed"
                }
            },
            j_para_the_singular = {
                name = "The Singular",
                text = {
                    "{X:mult,C:white}X#1#{} Mult if scoring hand",
                    "contains no cards with the",
                    "same {C:attention}rank, suit,{} and {C:attention}enhancement",
                    "as another scoring card"
                }
            },
            j_para_pokeren = {
                name = "diagonal ren",
                text = {
                    "For every {C:money}$#1#{C:inactive} ($#2#){} earned,",
                    "convert a random non-{C:diamonds}Diamond",
                    "in {C:attention}full deck{} to {C:diamonds}Diamonds"
                }
            },
            j_para_eris = {
                name = "Eris",
                text = {
                    "Convert a random non-{C:club}Club{} remaining in {C:attention}deck",
                    "to {C:clubs}Clubs{} for each {C:attention}Stone Card{} played",
                    "{C:attention}Stone Cards{} are considered {C:clubs}Clubs"
                }
            }
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
            },
            para_to_big_goldseal = {
                name = "Gold Seal",
                text = {
                    "Earn {C:money}$to_big(3){} dollars",
                    "when this card is scored"
                }
            },
            para_astro_joker_classify = {
                name = "Astro Jokers",
                text = {
                    "{C:planet}Astro{} Jokers are classified",
                    "as any Joker depicting",
                    "{C:planet}Astro,{} {C:red}Scrap,{}",
                    "or {C:green}Glorp/Glorpsto.{}",
                }
            },
            para_explain_suit_Spades = {
                name = "Spades",
                text = {
                    "{C:spades}Spades{} are a {C:attention}\"suit\"{}",
                    "in the game of {C:tarot}Poker,",
                    "{C:dark_edition}Blackjack,{} and any",
                    "{C:enhanced}card games{} using the normal",
                    "{C:spectral}Solitaire{} deck for their",
                    "{C:gold}gameplay,{} including {C:attention}Balatro.{}",
                    "{C:spades}Spades{} are a {C:spades}dark suit{},",
                    "based off of {C:attention}shovels.",
                    "{C:attention}Suits{} are archetypes of",
                    "{C:enhanced}cards{}, like {C:green}Ranks,{}",
                    "but mostly just the {C:enhanced}card's{}",
                    "{C:blue}\"Color\".{} If a hand contains",
                    "5 of the same {C:attention}Suit,{} the",
                    "hand has {C:attention}\"Flush\"{} tacked onto it."
                }
            },
            para_explain_suit_Hearts = {
                name = "Hearts",
                text = {
                    "{C:hearts}Hearts{} are a {C:attention}\"suit\"{}",
                    "in the game of {C:red}Crazy Eights,",
                    "{C:blue}Go Fish,{} and any",
                    "{C:enhanced}card games{} using the normal",
                    "{C:spectral}Solitaire{} deck for their",
                    "{C:gold}gameplay,{} including {C:attention}Balatro.{}",
                    "{C:hearts}Hearts{} are a {C:spades}light suit{},",
                    "based off of {C:attention}hearts.",
                    "{C:attention}Suits{} are archetypes of",
                    "{C:enhanced}cards{}, like {C:green}Ranks,{}",
                    "but mostly just the {C:enhanced}card's{}",
                    "{C:blue}\"Color\".{} If a hand contains",
                    "5 of the same {C:attention}Suit,{} the",
                    "hand has {C:attention}\"Flush\"{} tacked onto it."
                }
            },
            para_explain_suit_Diamonds = {
                name = "Diamonds",
                text = {
                    "{C:diamonds}Diamonds{} are a {C:attention}\"suit\"{}",
                    "in the game of {C:gold}Gin Rummy,",
                    "{C:green}War,{} and any",
                    "{C:enhanced}card games{} using the normal",
                    "{C:spectral}Solitaire{} deck for their",
                    "{C:gold}gameplay,{} including {C:attention}Balatro.{}",
                    "{C:diamonds}Hearts{} are a {C:diamonds}light suit{},",
                    "based off of {C:attention}jewels.",
                    "{C:attention}Suits{} are archetypes of",
                    "{C:enhanced}cards{}, like {C:green}Ranks,{}",
                    "but mostly just the {C:enhanced}card's{}",
                    "{C:blue}\"Color\".{} If a hand contains",
                    "5 of the same {C:attention}Suit,{} the",
                    "hand has {C:attention}\"Flush\"{} tacked onto it."
                }
            },
            para_explain_suit_Clubs = {
                name = "Clubs",
                text = {
                    "{C:clubs}Clubs{} are a {C:attention}\"suit\"{}",
                    "in the game of {C:legendary}Euchre,",
                    "{C:planet}Old Maid,{} and any",
                    "{C:enhanced}card games{} using the normal",
                    "{C:spectral}Solitaire{} deck for their",
                    "{C:gold}gameplay,{} including {C:attention}Balatro.{}",
                    "{C:clubs}Clubs{} are a {C:clubs}dark suit{},",
                    "based off of {C:attention}clovers.",
                    "{C:attention}Suits{} are archetypes of",
                    "{C:enhanced}cards{}, like {C:green}Ranks,{}",
                    "but mostly just the {C:enhanced}card's{}",
                    "{C:blue}\"Color\".{} If a hand contains",
                    "5 of the same {C:attention}Suit,{} the",
                    "hand has {C:attention}\"Flush\"{} tacked onto it."
                }
            },
            para_planets_explain = {
                name = "Planet Cards",
                text = {
                    "{C:planet}Planet Cards{} can be {C:attention}used{}",
                    "to {C:attention}level up{} the listed {C:enhanced}poker hand,",
                    "much like how {C:tarot}Tarot{} and",
                    "{C:spectral}Spectral{} cards can be used. {C:planet}Planet",
                    "{C:planet}Cards{} are based off of {C:planet}planets{} or",
                    "{C:planet,s:0.8}dwarf planets{} that are in",
                    "or near our {C:gold}solar system{}, but the",
                    "{C:enhanced}hand{} that a {C:planet}Planet Card",
                    "{C:attention}levels up{} has {C:dark_edition}no correlation{}",
                    "to its {C:attention}distance{} from the {C:gold}Sun.",
                }
            }
        },
        Planet = {},
        Spectral = {
            c_para_Talisman = {
                name = "Talisman",
                text = {
                    "Oops! The game crashed:",
                    "attempt to {C:gold}compare number{} with table"
                }
            }
        },
        Stake = {},
        Tag = {
            tag_para_foodtag = {
                name = 'Safe Room Tag',
                text = {
                    'Open a free {C:enhanced}Snack Pack{}'
                }
            }
        },
        Tarot = {
            c_para_arson = {
                name = "Arson",
                text = {
                    "Enhances {C:attention}#1#{}",
                    "selected cards to",
                    "{C:attention}#2#s",
                }
            },
        },
        Sleeve = {
            sleeve_para_yurisleeve = {
                name = "Yuri Sleeve",
                text = {
                    "{s:0.8}Start with an",
                    "{s:0.8,C:attention,T:m_eternal}Eternal{s:0.8} {s:0.8,C:rare,T:j_blueprint}Blueprint{s:0.8} and an {s:0.8,C:attention}Eternal{} {s:0.8,C:rare,T:j_brainstorm}Brainstorm",
                    "{C:red,s:0.8}#1#{s:0.8} Joker slot, {s:0.8,C:blue}#2#{s:0.8} hand",
                },
            },
            sleeve_para_yurisleeve_alt = {
                name = "{C:edition}Yuri Sleeve",
                text = {
                    "{s:0.8}Start with an additional",
                    "{s:0.8,C:dark_edition,T:e_negative}Negative {s:0.8,C:attention,T:m_eternal}Eternal{s:0.8} {s:0.8,C:rare,T:j_blueprint}Blueprint{s:0.8} and a {s:0.8,C:dark_edition}Negative {s:0.8,C:attention}Eternal{s:0.8} {s:0.8,C:rare,T:j_brainstorm}Brainstorm",
                    "{s:0.8,C:red}#1#{} Joker slot",
                }
            },
            sleeve_para_chasmsleeve = {
                name = "Chasm Sleeve",
                text = {
                    "{C:red}#1#{} Joker slots",
                    '{C:blue}#2#{} hands each round',
                    '{C:attention}+#3#{} hand size',
                },
                unlock = {
                    'Win with {C:attention}#1#{}',
                    'and {C:attention}#2#',
                    'on at least',
                    '{C:gold}Gold Stake{} difficulty'
                }
            },
            sleeve_para_chasmsleeve_alt1 = {
                name = "{C:edition}Chasm Sleeve",
                text = {
                    '{C:red}#1#{} discards each round',
                    '{C:attention}+#2#{} card selection limit',
                    "{s:0.3} ",
                },
                unlock = {
                    'Win with {C:attention}#1#{}',
                    'and {C:attention}#2#',
                    'on at least',
                    '{C:gold}Gold Stake{} difficulty'
                }
            },
            sleeve_para_chasmsleeve_alt2 = {
                name = "{C:edition}Chasm Sleeve",
                text = {
                    '{C:red}#1#{} discards each round',
                    '{C:attention}+#2#{} hand size',
                },
                unlock = {
                    'Win with {C:attention}#1#{}',
                    'and {C:attention}#2#',
                    'on at least',
                    '{C:gold}Gold Stake{} difficulty'
                }
            },
            sleeve_para_chasmsleeve_alt3 = {
                name = "Chasm Sleeve",
                text = {
                    "{C:red}#1#{} Joker slots",
                    '{C:red}#2#{} discards each round',
                    '{C:attention}+#3#{} hand size',
                },
                unlock = {
                    'Win with {C:attention}#1#{}',
                    'and {C:attention}#2#',
                    'on at least',
                    '{C:gold}Gold Stake{} difficulty'
                }
            },
            sleeve_para_chasmsleeve_alt4 = {
                name = "{C:edition}Chasm Sleeve",
                text = {
                    "{C:red}#1#{} Joker slots",
                    '{C:blue}#2#{} hands each round',
                    '{C:attention}+#3#{} card selection limit',
                },
                unlock = {
                    'Win with {C:attention}#1#{}',
                    'and {C:attention}#2#',
                    'on at least',
                    '{C:gold}Gold Stake{} difficulty'
                }
            },
            sleeve_para_chasmsleeve_alt5 = {
                name = "{C:edition}Chasm Sleeve",
                text = {
                    '{C:blue}#1#{} hands each round',
                    '{C:attention}+#2#{} card selection limit',
                },
                unlock = {
                    'Win with {C:attention}#1#{}',
                    'and {C:attention}#2#',
                    'on at least',
                    '{C:gold}Gold Stake{} difficulty'
                }
            },
            sleeve_para_voidsleeve = {
                name = "Void Sleeve",
                text = {
                    "{C:attention}+#1#{} Joker slots",
                    '{C:blue}#2#{} hands each round',
                },
                unlock = {
                    'Win with {C:attention}#1#{}',
                    'on at least',
                    '{C:gold}Gold Stake{} difficulty'
                }
            },
            sleeve_para_voidsleeve_unfiltered = {
                name = "Void Sleeve",
                text = {
                    "{C:attention}+#1#{} Joker slots",
                    '{C:blue}#2#{} hands each round',
                },
                unlock = {
                    'Win with {C:attention}#1#{}',
                    'on at least',
                    '{C:gold}Gold Stake{} difficulty'
                }
            },
            sleeve_para_voidsleeve_unfiltered_alt = {
                name = "{C:edition}Void Sleeve",
                text = {
                    "{C:attention}+#1#{} Joker slots",
                    '{C:red}#2#{} discards each round',
                },
                unlock = {
                    'Win with {C:attention}#1#{}',
                    'on at least',
                    '{C:gold}Gold Stake{} difficulty'
                }
            },
            sleeve_para_voidsleeve_upgraded = {
                name = "Void Sleeve",
                text = {
                    "{s:0.8}When the Boss Blind on",
                    "{s:0.8}an even Ante is defeated,",
                    'gain {C:attention}+#1#{} Joker slot and lose {C:blue}#2#{} hand',
                    "{C:inactive,s:0.8}Effect will not trigger if you have 1 hand",
                },
                unlock = {
                    'Win with {C:attention}#1#{}',
                    'on at least',
                    '{C:gold}Gold Stake{} difficulty'
                }
            },
            sleeve_para_voidsleeve_upgraded_alt = {
                name = "{C:edition}Void Sleeve",
                text = {
                    "{s:0.8}When the Boss Blind on",
                    "{s:0.8}an even Ante is defeated,",
                    'gain {C:attention}+#1#{} Joker slot and lose {C:red}#2#{} discard',
                    "{C:inactive,s:0.8}Effect will not trigger if you have 1 discard",
                },
                unlock = {
                    'Win with {C:attention}#1#{}',
                    'on at least',
                    '{C:gold}Gold Stake{} difficulty'
                }
            },
            sleeve_para_artisticsleeve = {
                name = "Artistic Sleeve",
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
            sleeve_para_artisticsleeve_unfiltered = {
                name = "Artistic Sleeve",
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
            sleeve_para_artisticsleeve_unfiltered_alt1 = {
                name = "{C:edition}Artistic Sleeve",
                text = {
                    '{C:attention}+#1#{} selection limit'
                },
                unlock = {
                    'Win with {C:attention}#1#{}',
                    'on at least',
                    '{C:gold}Gold Stake{} difficulty'
                }
            },
            sleeve_para_artisticsleeve_unfiltered_alt2 = {
                name = "{C:edition}Artistic Sleeve",
                text = {
                    "{C:red}#1#{} Joker slots",
                    '{C:attention}+#2#{} selection limit'
                },
                unlock = {
                    'Win with {C:attention}#1#{}',
                    'on at least',
                    '{C:gold}Gold Stake{} difficulty'
                }
            },
            sleeve_para_artisticsleeve_upgraded_alt = {
                name = "{C:edition}Artistic Sleeve",
                text = {
                    '{C:attention}+#1#{} selection limit',
                    "when Boss Blind is defeated",
                    "Does not trigger on the",
                    "Ante 1 boss"
                },
                unlock = {
                    'Win with {C:attention}#1#{}',
                    'on at least',
                    '{C:gold}Gold Stake{} difficulty'
                }
            },
            sleeve_para_artisticsleeve_upgraded = {
                name = "Artistic Sleeve",
                text = {
                    "{C:red}#1#{} Joker slots",
                    '{C:red}#2#{} hand size',
                    "{C:attention}+#3#{} hand size when",
                    "Boss Blind is defeated",
                },
                unlock = {
                    'Win with {C:attention}#1#{}',
                    'on at least',
                    '{C:gold}Gold Stake{} difficulty'
                }
            }
        },
        Voucher = {},
        Para_Dialogue = {
            para_gameset_intro = {
                name = "",
                text = {
                    "Welcome to {C:edition,E:1}Paradox's Stupid Ideas{}!",
                    "Before you begin playing, there are",
                    "some things you need to configure.",
                    "{C:inactive,s:1.6}thanks aikoyori for letting me take all of their ui code"
                }
            },
            para_gameset_details = {
                name = "",
                text = {
                    "There are two ways to play: the {C:red}Unfiltered{} Gameset,",
                    "and the {C:green}Upgraded{} Gameset.",
                    "- {C:red}Unfiltered{} - Less balanced, but with more jokes",
                    "and some special exclusive content",
                    "- {C:green}Upgraded{} - A more balanced and vanilla-esque",
                    "experience: however, you may miss some content",
                    "{C:inactive}--------------------------------------------------------",
                    "{s:1.6}These can be changed in the mod settings at any time, though",
                    "{s:1.6}changing this during a run may break your current run.",
                    "{s:1.6}It's recommended to restart the game and your run",
                    "{s:1.6}when changing these settings, and bugs arising from not doing",
                    "{s:1.6}this will likely not be handled"
                }
            },
        }
    },
    misc = {
        achievement_descriptions = {
            ach_para_deathbypineapple = 'Snack on some pineapple slices.',
            ach_para_cardcollector = "Obtain every colorful card."
        },
        achievement_names = {
            ach_para_deathbypineapple = 'Best idea you\'ve ever had!',
            ach_para_cardcollector = "Color Collector"
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
            para_k_transformed = "Transformed!",
            k_para_prestige = "Prestigious",
            k_para_nft = "NFT",
            airplane_a1 = "(Currently ",
            airplane_a2 = "(Currently ",
            airplane_b1 = " free reroll)",
            airplane_b2 = " free rerolls)",
            k_para_takingtoolong = "YOUR TAKING TOO LONG",
            k_para_cleared = "Bonus cleared!",
            k_para_next = "Next",
            k_para_end = "End",
            para_time = "time",
            para_times = "times",
            k_para_optimize = "Removed for optimization",
            k_para_upgraded_dialog_text = "Upgraded",
            k_para_upgraded_dialog_description = "A more fine-tuned vanilla experience",
            k_para_unfiltered_dialog_text = "Unfiltered",
            k_para_unfiltered_dialog_description = "A bit less balanced with some more content",
            k_para_balance_descriptions = {
                'More content and jokes with less balance',
                'A handcrafted vanilla-esque experience',
            },
            para_info_balance_text = {
                "   ",
                "   ",
                "It's recommended to restart your run and",
                "the game (in that order) when changing balance settings.",
                "Bugs arising from not doing this will not be handled."
            },
            k_para_balance_selects = {
                'Unfiltered',
                'Upgraded',
            },
            k_para_config_balance_txt = "Balance",
            k_para_infobox_descriptions = {
                'No infoboxes. Increases performance.',
                'The standard amount of infoboxes.',
                "Some extra infoboxes for extra clarity. May reduce performance.",
            },
            k_para_infobox_selects = {
                'None',
                'Standard',
                "Extra"
            },
            k_para_config_infobox_txt = "Infoboxes",
        },
        high_scores = {},
        labels = {
            k_para_prestige = "Prestigious",
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
            pow_chips = {"^#1#"},
            money_loss = {"-$#1#"},
            para_art = { "Art: #1#" },
            para_code = { "Code: #1#" },
            para_idea = { "Idea: #1#" },
        },
        v_text = {},
    },
}