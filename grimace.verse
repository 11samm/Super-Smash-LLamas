using { /Fortnite.com/Characters }
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /Verse.org/Random }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/SpatialMath }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
#This ability jump scares a random nearby opponent
grimace := class(creative_device):

    @editable
    Remote:signal_remote_manager_device = signal_remote_manager_device{}

    @editable
    Incoming: hud_message_device = hud_message_device{}

    @editable
    nokia : audio_player_device=audio_player_device{}

    # This function runs when the ability is activated
    OnPress(Agent: agent): void=
        AllPlayers:[]player = GetPlayspace().GetPlayers()

        PlayerCount: int = AllPlayers.Length

        # Finds the closest player at the time of ability activation
        var ClosestPlayer: ?agent = false
        var DistanceToMe: float = 1000000000.0
        var FoundPlayer: logic = false
        for(Player: AllPlayers):
            if(Player<>Agent):
                if(MyFC:fort_character=Agent.GetFortCharacter[]):
                    if(OtherFC:fort_character= Player.GetFortCharacter[]):
                        MyPos:vector3=MyFC.GetTransform().Translation
                        OtherPos:vector3=OtherFC.GetTransform().Translation
                        TotalDistance:float=Distance(MyPos, OtherPos) / 100.0
                        if(TotalDistance < DistanceToMe):
                            set FoundPlayer = true
                            set DistanceToMe = TotalDistance
                            set ClosestPlayer = option{Player}
        
        # Places jumpscare and sound queue on nearby opponent                    
        if(FoundPlayer=true):
            if (OppAgent:agent=agent[ClosestPlayer?]):
                Incoming.Show(OppAgent)      
                nokia.Play(OppAgent)              


    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        Remote.PrimarySignalEvent.Subscribe(OnPress)