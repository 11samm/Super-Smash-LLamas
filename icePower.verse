
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
# This ability makes the floor slippery for all enemies
icePower := class(creative_device):

    @editable
    Remote:signal_remote_manager_device = signal_remote_manager_device{}

    @editable
    grah : audio_player_device=audio_player_device{}

    @editable
    fries:grind_powerup_device=grind_powerup_device{}

    # Runs when ability is used
    OnPress(Agent: agent): void=
        AllPlayers:[]player = GetPlayspace().GetPlayers()

        PlayerCount: int = AllPlayers.Length

        # Cycles through all alive players and inflicts slippery feet debuff
        for(Player: AllPlayers):
            if(Player<>Agent):
                fries.Pickup(Player)
                grah.Play(Player)
                

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        Remote.PrimarySignalEvent.Subscribe(OnPress)