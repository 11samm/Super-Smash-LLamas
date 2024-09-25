using { /Fortnite.com/Characters }
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
# This ability removes the player from the map and places them in a temporary safe house
austin := class(creative_device):

    # Index for player location
    var location:int=0

    @editable
    Remote:signal_remote_manager_device = signal_remote_manager_device{}

    @editable
    rvTP:teleporter_device=teleporter_device{}

    @editable
    tp1:teleporter_device=teleporter_device{}

    @editable
    tp2:teleporter_device=teleporter_device{}

    @editable
    tp3:teleporter_device=teleporter_device{}

    @editable
    tp4:teleporter_device=teleporter_device{}

    @editable
    tp5:teleporter_device=teleporter_device{}

    @editable
    tp6:teleporter_device=teleporter_device{}

    @editable
    trigger1:trigger_device=trigger_device{}

    @editable
    trigger2:trigger_device=trigger_device{}

    @editable
    trigger3:trigger_device=trigger_device{}

    @editable
    trigger4:trigger_device=trigger_device{}

    @editable
    trigger5:trigger_device=trigger_device{}

    @editable
    trigger6:trigger_device=trigger_device{}

    # When abliity is pressed, an event is passed to TPHandler
    OnPress(Agent: agent): void=
        if(FC:fort_character=Agent.GetFortCharacter[]):
            spawn{TPHandler(Agent, FC)}
          
            
    TPHandler(Agent: agent, FC: fort_character)<suspends>: void=
        # Grabs players inital health and shield when activating ability
        var curHealth:float=0.0
        set curHealth= FC.GetHealth()
        var curShield:float=0.0
        set curShield= FC.GetShield()
        # Sets the values to be able to resist the out of bounds damage they will take
        FC.SetMaxHealth(20000.0)
        FC.SetHealth(20000.0)
        # Teleports player to safe house
        rvTP.Teleport(Agent)
        # Waits 7 seconds before sending player back to the map
        Sleep(7.0)
        if (location=1):
            tp1.Teleport(Agent)
        if (location=2):
            tp2.Teleport(Agent)
        if (location=3):
            tp3.Teleport(Agent)
        if (location=4):
            tp4.Teleport(Agent)
        if (location=5):
            tp5.Teleport(Agent)
        if (location=6):
            tp6.Teleport(Agent)
        # Sets player health and shield back to what it was
        FC.SetMaxHealth(100.0)
        FC.SetHealth(curHealth)
        FC.SetShield(curShield)

    trig1(Agent: ?agent):void=
        set location =1
    trig2(Agent: ?agent):void=
        set location =2
    trig3(Agent: ?agent):void=
        set location =3
    trig4(Agent: ?agent):void=
        set location =4
    trig5(Agent: ?agent):void=
        set location =5
    trig6(Agent: ?agent):void=
        set location =6
                

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        trigger1.TriggeredEvent.Subscribe(trig1)
        trigger2.TriggeredEvent.Subscribe(trig2)
        trigger3.TriggeredEvent.Subscribe(trig3)
        trigger4.TriggeredEvent.Subscribe(trig4)
        trigger5.TriggeredEvent.Subscribe(trig5)
        trigger6.TriggeredEvent.Subscribe(trig6)

        Remote.PrimarySignalEvent.Subscribe(OnPress)