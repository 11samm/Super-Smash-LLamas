
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /Fortnite.com/Playspaces}
using { /Verse.org/Verse }
using { /Verse.org/Native }
using { /UnrealEngine.com/Temporary/SpatialMath }
using { /Fortnite.com/Characters }
using { /Fortnite.com/Game }


# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
# Custom device made to handle knockback mechanic
gameManager := class(creative_device):

    var Players : []player = array{}

    @editable
    dogDetect: conditional_button_device = conditional_button_device{}

    @editable 
    MM:movement_modulator_device = movement_modulator_device{}

    @editable
    MM_Mover:creative_prop=creative_prop{}

    @editable 
    MM2:movement_modulator_device = movement_modulator_device{}

    @editable
    MM2_Mover:creative_prop=creative_prop{}

    @editable 
    MM3:movement_modulator_device = movement_modulator_device{}

    @editable
    MM3_Mover:creative_prop=creative_prop{}

    @editable 
    MM4:movement_modulator_device = movement_modulator_device{}

    @editable
    MM4_Mover:creative_prop=creative_prop{}

    @editable 
    MM5:movement_modulator_device = movement_modulator_device{}

    @editable
    MM5_Mover:creative_prop=creative_prop{}

    @editable 
    MM6:movement_modulator_device = movement_modulator_device{}

    @editable
    MM6_Mover:creative_prop=creative_prop{}

    @editable 
    MM7:movement_modulator_device = movement_modulator_device{}

    @editable
    MM7_Mover:creative_prop=creative_prop{}

    @editable 
    MM8:movement_modulator_device = movement_modulator_device{}

    @editable
    MM8_Mover:creative_prop=creative_prop{}

    @editable 
    MM9:movement_modulator_device = movement_modulator_device{}

    @editable
    MM9_Mover:creative_prop=creative_prop{}

    @editable 
    MM10:movement_modulator_device = movement_modulator_device{}

    @editable
    MM10_Mover:creative_prop=creative_prop{}

    # When a player's shield is damaged this finds the player that inflicting the damage onto them
    OnPlayerDamaged(d:damage_result):void=
        if(InstigatorCharacter := fort_character[d.Target], player[InstigatorCharacter.GetAgent[]]):
            if(OppCharacter := fort_character[d.Instigator?], player[OppCharacter.GetAgent[]]):
                if(IsAgent:agent= InstigatorCharacter.GetAgent[]):
                    # There is an ability that makes players resistant to knockback when holding a certain item
                    if(dogDetect.IsHoldingItem[IsAgent]):
                        option:
                            MM2_Mover.TeleportTo[InstigatorCharacter.GetTransform().Translation, OppCharacter.GetTransform().Rotation]

                        if(MM2_Mover.TeleportTo[MM_Mover.GetTransform().Translation- vector3{Z:=10752.0},MM_Mover.GetTransform().Rotation]):
                    # Checks player health and then knocks them back based on their shield in the direction the opponent was facing
                    else if(InstigatorCharacter.GetShield() > 9900.0):
                        option:
                            MM_Mover.TeleportTo[InstigatorCharacter.GetTransform().Translation, OppCharacter.GetTransform().Rotation]

                        if(MM_Mover.TeleportTo[MM_Mover.GetTransform().Translation- vector3{Z:=10752.0},MM_Mover.GetTransform().Rotation]):

                    else if(InstigatorCharacter.GetShield() > 9700.0):
                        option:
                            MM2_Mover.TeleportTo[InstigatorCharacter.GetTransform().Translation, OppCharacter.GetTransform().Rotation]

                        if(MM2_Mover.TeleportTo[MM2_Mover.GetTransform().Translation- vector3{Z:=10752.0},MM2_Mover.GetTransform().Rotation]):

                    else if(InstigatorCharacter.GetShield() > 9500.0):
                        option:
                            MM3_Mover.TeleportTo[InstigatorCharacter.GetTransform().Translation, OppCharacter.GetTransform().Rotation]

                        if(MM3_Mover.TeleportTo[MM3_Mover.GetTransform().Translation- vector3{Z:=10752.0},MM3_Mover.GetTransform().Rotation]):

                    else if(InstigatorCharacter.GetShield() > 9350.0):
                        option:
                            MM4_Mover.TeleportTo[InstigatorCharacter.GetTransform().Translation, OppCharacter.GetTransform().Rotation]

                        if(MM4_Mover.TeleportTo[MM4_Mover.GetTransform().Translation- vector3{Z:=10752.0},MM4_Mover.GetTransform().Rotation]):
                            
                    else if(InstigatorCharacter.GetShield() > 9200.0):
                        option:
                            MM5_Mover.TeleportTo[InstigatorCharacter.GetTransform().Translation, OppCharacter.GetTransform().Rotation]

                        if(MM5_Mover.TeleportTo[MM5_Mover.GetTransform().Translation- vector3{Z:=10752.0},MM5_Mover.GetTransform().Rotation]):

                    else if(InstigatorCharacter.GetShield() > 9050.0):
                        option:
                            MM6_Mover.TeleportTo[InstigatorCharacter.GetTransform().Translation, OppCharacter.GetTransform().Rotation]

                        if(MM6_Mover.TeleportTo[MM6_Mover.GetTransform().Translation- vector3{Z:=10752.0},MM6_Mover.GetTransform().Rotation]):

                    else if(InstigatorCharacter.GetShield() > 8900.0):
                        option:
                            MM7_Mover.TeleportTo[InstigatorCharacter.GetTransform().Translation, OppCharacter.GetTransform().Rotation]

                        if(MM7_Mover.TeleportTo[MM7_Mover.GetTransform().Translation- vector3{Z:=10752.0},MM7_Mover.GetTransform().Rotation]):

                    else if(InstigatorCharacter.GetShield() > 8800.0):
                        option:
                            MM8_Mover.TeleportTo[InstigatorCharacter.GetTransform().Translation, OppCharacter.GetTransform().Rotation]

                        if(MM8_Mover.TeleportTo[MM8_Mover.GetTransform().Translation- vector3{Z:=10752.0},MM8_Mover.GetTransform().Rotation]):

                    else if(InstigatorCharacter.GetShield() > 8600.0):
                        option:
                            MM9_Mover.TeleportTo[InstigatorCharacter.GetTransform().Translation, OppCharacter.GetTransform().Rotation]

                        if(MM9_Mover.TeleportTo[MM9_Mover.GetTransform().Translation- vector3{Z:=10752.0},MM9_Mover.GetTransform().Rotation]):

                    else:
                        option:
                            MM10_Mover.TeleportTo[InstigatorCharacter.GetTransform().Translation, OppCharacter.GetTransform().Rotation]

                        if(MM10_Mover.TeleportTo[MM10_Mover.GetTransform().Translation- vector3{Z:=10752.0},MM10_Mover.GetTransform().Rotation]):
        
        
# Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        set Players = GetPlayspace().GetPlayers()
        for (elt : Players, FortCharacter := elt.GetFortCharacter[]):
            FortCharacter.DamagedShieldEvent().Subscribe(OnPlayerDamaged)

