using { /Fortnite.com/Characters }
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
# This ability heals the players damaged shield
moneyHeal := class(creative_device):
    @editable
    moneyTrigger:trigger_device=trigger_device{}

    # When ability is triggered it find the player that activated it
    Healer(Agent: ?agent):void=
        if(RealAgent:agent=Agent?):
            if(FC:fort_character=fort_character[RealAgent.GetFortCharacter[]]):
                spawn{HealLoop(FC)}

    # Checks if the player would go over max shield value and heals the shield by 200 points then inflicts a 19 second cooldown
    HealLoop(FC:fort_character)<suspends>:void=
        var curShield:float=0.0
        loop:
            Sleep(1.0)
            set curShield= FC.GetShield()
            if(curShield+200.0> FC.GetMaxShield()):
                FC.SetShield(10000.0)
            else:       
                FC.SetShield(curShield+200.0)
            Sleep(19.0)


            

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        moneyTrigger.TriggeredEvent.Subscribe(Healer)