using { /Fortnite.com/Characters }
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
# This ability turns the player invisible if there is a certain item in their hand
carti := class(creative_device):
    @editable
    cartiDetect: conditional_button_device = conditional_button_device{}

    # Helper functions to show and hide player
    ShowPlayer(Agent: agent): void=
        if(FC:=Agent.GetFortCharacter[]):
            FC.Show()

    HidePlayer(Agent: agent): void=
        if(FC:=Agent.GetFortCharacter[]):
            FC.Hide()


    # Checks if player is holding the card to go invisible every second and updates their visibility
    CheckForCard()<suspends>:void=
        loop:
            Sleep(1.0)
            AllPlayers:=GetPlayspace().GetPlayers()
            for(Player:AllPlayers):
                if(IsAgent:agent= agent[Player]):
                    if (cartiDetect.IsHoldingItem[IsAgent]):
                        HidePlayer(IsAgent)
                    else:
                        ShowPlayer(IsAgent)


    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        spawn:
            CheckForCard()