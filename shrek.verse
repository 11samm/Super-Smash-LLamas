using { /Fortnite.com/Characters }
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
# This ability makes the players screen begin changing FOV, shaking, and projecting strobe lights
shrek := class(creative_device):
    @editable
    Remote:signal_remote_manager_device = signal_remote_manager_device{}

    @editable
    trigger:trigger_device=trigger_device{}

    # When ability is activated this function runs
    OnPress(Agent: agent): void=

        # Finds all players and then contacts an external trigger to inflict the custom screen changes
        AllPlayers:[]player = GetPlayspace().GetPlayers()

        PlayerCount: int = AllPlayers.Length

        for(Player: AllPlayers):
            if(Player<>Agent):
                trigger.Trigger(Player)

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        Remote.PrimarySignalEvent.Subscribe(OnPress)
