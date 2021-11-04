//
//  Cards.swift
//  Axie Battle Simulator
//
//  Created by masaki on 2021/11/01.
//

import SwiftUI

struct Cards: View {
    
    @State var filter = ""
    @State var edit_n = 0
    @State var mine = true
    @EnvironmentObject var userData : User
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            ZStack{
                
                Color("bg")
                    .edgesIgnoringSafeArea(.all)
                
        ScrollView(.vertical,showsIndicators: false){
            
            ForEach(cards,id:\.self){ card in
                
                if filter.isEmpty || filter == card.parts {
                
                    Button(action:{
                        switch filter {
                            case "back" :
                            if mine {
                                userData.MyTeam[edit_n].cards[0] = card.name
                            }
                            else {
                                userData.OppTeam[edit_n].cards[0] = card.name
                            }
                            case "horn" :
                            if mine {
                                userData.MyTeam[edit_n].cards[1] = card.name
                            }
                            else {
                                userData.OppTeam[edit_n].cards[1] = card.name
                            }
                            case "mouth" :
                            if mine {
                                userData.MyTeam[edit_n].cards[2] = card.name
                            }
                            else {
                                userData.OppTeam[edit_n].cards[2] = card.name
                            }
                            case "tail" :
                            if mine {
                                userData.MyTeam[edit_n].cards[3] = card.name
                            }
                            else {
                                userData.OppTeam[edit_n].cards[3] = card.name
                            }
                        default:
                            print("Error")
                        }
                        
                        userData.UpdateStat(mine : mine, index: edit_n)
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                        
                    }){
                ZStack{
                    
                    Image(card.img)
                    
                    VStack{
                        
                        Spacer()
                        
                        Text(card.Effect)
                            .fontWeight(.light)
                            .foregroundColor(.white)
                            .frame(width: maxwidth*0.55, height : 150)
                        
                        
                    }
                    .padding(.leading,35)
                    
                    HStack{
                        VStack(alignment : .leading){
                        
                        ZStack(){
                            Circle()
                                .fill(Color("Point"))
                            ZStack{
                                
                                Circle()
                                    .fill(Color("attack"))
                                    .padding()
                                
                                Text("\(card.attack)")
                                    .font(.system(size:30))
                                    .fontWeight(.black)
                                    .padding(5)
                            }
                        }
                        .frame(width:70,height:70)
                        
                        ZStack{
                            Circle()
                                .fill(Color("Point"))
                            
                            ZStack{
                                
                                Circle()
                                    .fill(Color("defend"))
                                    .padding()
                                
                                Text("\(card.defend)")
                                    .font(.system(size:30))
                                    .fontWeight(.black)
                                    .padding(5)
                            }
                        }
                        .frame(width:70,height:70)

                    }
                        
                        Spacer()
                    }
                    .padding(.bottom,80)
                    .padding(.leading)
                    
                    VStack{
                        
                        Text(card.name)
                            .font(.system(size:20))
                            .fontWeight(.black)
                            .kerning(0)
                        Spacer()
                    }
                    .padding(.top,31)
                    .padding(.leading)
                    
                    VStack{
                        HStack{
                        Text("\(card.energy)")
                            .font(.system(size:40))
                            .fontWeight(.black)
                        
                        }
                        .frame(width : maxwidth/1.55,alignment :.leading)
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                }
                .foregroundColor(.white)
                    }
                }
                
            }
            .padding(.top,5)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
            }
        }
        
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Cards_Previews: PreviewProvider {
    static var previews: some View {
        Cards().environmentObject(User())
    }
}


var cards = [
    
    //// AQUA
    //back
    CardsModel(name: "Shelter",parts:"back",_class:"aqua", img: "aquatic-back-2", energy: 1, attack: 0, defend: 115, Effect: "Disable critical strikes on this Axie during this round"),
    CardsModel(name: "Scale Dart",parts:"back",_class:"aqua", img: "aquatic-back-4", energy: 1, attack: 120, defend: 30, Effect: "Draw a card if target is in Last Stand."),
    CardsModel(name: "Swift Escape",parts:"back",_class:"aqua", img: "aquatic-back-6", energy: 1, attack: 110, defend: 20, Effect: "Apply Speed+ to this Axie for 2 rounds when attacked."),
    CardsModel(name: "Shipwreck",parts:"back",_class:"aqua", img: "aquatic-back-8", energy: 1, attack: 60, defend: 90, Effect: "Apply Attack+ to this Axie if its shield breaks."),
    CardsModel(name: "Aqua Vitality",parts:"back",_class:"aqua", img: "aquatic-back-10", energy: 1, attack: 80, defend: 40, Effect: "Successful attacks restore 50 HP for each Anemone part this Axie posseses."),
    CardsModel(name: "Spinal Tap",parts:"back",_class:"aqua", img: "aquatic-back-12", energy: 1, attack: 100, defend: 20, Effect: "Prioritize idle target when comboed with at least 2 additional cards."),
    
    //horn
    CardsModel(name: "Shell Jap",parts:"horn",_class:"aqua", img: "aquatic-horn-2", energy: 1, attack: 100, defend: 50, Effect: "Deal 130% damage when attacking an idle target."),
    CardsModel(name: "Deep Sea Gore",parts:"horn",_class:"aqua", img: "aquatic-horn-4", energy: 1, attack: 50, defend: 80, Effect: "Add 30% to this Axie's shield when attacking."),
    CardsModel(name: "Clam Slash",parts:"horn",_class:"aqua", img: "aquatic-horn-6", energy: 1, attack: 110, defend: 40, Effect: "Apply Attack+ to this Axie when attacking Beast, Bug, or Mech targets."),
    CardsModel(name: "Aquaponics",parts:"horn",_class:"aqua", img: "aquatic-horn-8", energy: 1, attack: 80, defend: 40, Effect: "Successful attacks restore 50 HP for each Anemone part this Axie posseses."),
    CardsModel(name: "Hero's Bane",parts:"horn",_class:"aqua", img: "aquatic-horn-10", energy: 1, attack: 120, defend: 30, Effect: "End target's Last Stand."),
    CardsModel(name: "Star Shuriken",parts:"horn",_class:"aqua", img: "aquatic-horn-12", energy: 1, attack: 115, defend: 10, Effect: "Target cannot enter Last Stand if this card brings its HP to zero."),
    
    //mouth
    CardsModel(name: "Angry Lam",parts:"mouth",_class:"aqua", img: "aquatic-mouth-2", energy: 1, attack: 110, defend: 40, Effect: "Deal 120% damage if this Axie's HP is below 50%."),
    CardsModel(name: "Swallow",parts:"mouth",_class:"aqua", img: "aquatic-mouth-4", energy: 1, attack: 80, defend: 30, Effect: "Heal this Axie by the damage inflicted with this card."),
    CardsModel(name: "Fish Hook",parts:"mouth",_class:"aqua", img: "aquatic-mouth-8", energy: 1, attack: 110, defend: 30, Effect: "Apply Attack+ to this Axie when attacking Plant, Reptile, or Dusk targets."),
    CardsModel(name: "Crimson Water",parts:"mouth",_class:"aqua", img: "aquatic-mouth-10", energy: 1, attack: 130, defend: 20, Effect: "Target injured enemy if this Axie's HP is below 50%."),
    
    //tail
    CardsModel(name: "Upstream Swim",parts:"tail",_class:"aqua", img: "aquatic-tail-2", energy: 1, attack: 110, defend: 30, Effect: "Apply Speed+ to this Axie for 2 rounds when comboed with another Aquatic _class card."),
    CardsModel(name: "Tail Slap",parts:"tail",_class:"aqua", img: "aquatic-tail-4", energy: 1, attack: 30, defend: 0, Effect: "Gain 1 energy when comboed with another card."),
    CardsModel(name: "Black Bubble",parts:"tail",_class:"aqua", img: "aquatic-tail-6", energy: 1, attack: 100, defend: 40, Effect: "Apply Jinx to target for 2 rounds."),
    CardsModel(name: "Water Sphere",parts:"tail",_class:"aqua", img: "aquatic-tail-8", energy: 1, attack: 110, defend: 30, Effect: "Apply Chill to target for 2 rounds."),
    CardsModel(name: "Flanking Smack",parts:"tail",_class:"aqua", img: "aquatic-tail-10", energy: 1, attack: 100, defend: 40, Effect: "Deal 120% damage if this Axie attacks first."),
    CardsModel(name: "Chitin Jump",parts:"tail",_class:"aqua", img: "aquatic-tail-12", energy: 1, attack: 30, defend: 30, Effect: "Prioritizes furthest target."),
    
    ////Beast
    
    //back
    CardsModel(name: "Single Combat",parts:"back",_class:"beast", img: "beast-back-2", energy: 1, attack: 75, defend: 0, Effect: "Guaranteed critical strike when comboed with at least 2 other cards."),
    CardsModel(name: "Heroic Reward",parts:"back",_class:"beast", img: "beast-back-4", energy: 0, attack: 60, defend: 0, Effect: "Draw a card when attacking an Aquatic, Bird, or Dawn target."),
    CardsModel(name: "Nitro Leap",parts:"back",_class:"beast", img: "beast-back-6", energy: 1, attack: 115, defend: 35, Effect: "Always strike first if this Axie is in Last Stand."),
    CardsModel(name: "Revenge Arrow",parts:"back",_class:"beast", img: "beast-back-8", energy: 1, attack: 125, defend: 25, Effect: "Deal 150% damage if this Axie is in Last Stand."),
    CardsModel(name: "Woodman Power",parts:"back",_class:"beast", img: "beast-back-10", energy: 1, attack: 50, defend: 100, Effect: "Add Shield equal to the damage this cards deals to Plant targets."),
    CardsModel(name: "Juggling Balls",parts:"back",_class:"beast", img: "beast-back-12", energy: 1, attack: 40, defend: 30, Effect: "Strike 3 times."),

    //horn
    CardsModel(name: "Branch Charge",parts:"horn",_class:"beast", img: "beast-horn-2", energy: 1, attack: 125, defend: 25, Effect: "Increase crit chance by 20% if chained or comboed with a plant card."),
    CardsModel(name: "Ivory Stab",parts:"horn",_class:"beast", img: "beast-horn-4", energy: 1, attack: 70, defend: 20, Effect: "Gain 1 energy per critical strike dealt by your team this round."),
    CardsModel(name: "Merry Legion",parts:"horn",_class:"beast", img: "beast-horn-6", energy: 1, attack: 65, defend: 85, Effect: "Add 20% shield to this Axie when played in a chain."),
    CardsModel(name: "Sugar Rush",parts:"horn",_class:"beast", img: "beast-horn-8", energy: 1, attack: 120, defend: 20, Effect: "Deal 10% additional damage for each allied Bug Axie."),
    CardsModel(name: "Sinister Strike",parts:"horn",_class:"beast", img: "beast-horn-10", energy: 1, attack: 130, defend: 20, Effect: "Deal 250% damage on critical strikes."),
    CardsModel(name: "Acrobatic",parts:"horn",_class:"beast", img: "beast-horn-12", energy: 1, attack: 100, defend: 50, Effect: "Apply Speed + to this Axie for 2 rounds when attacked."),

    //mouth
    CardsModel(name: "Nut Crack",parts:"mouth",_class:"beast", img: "beast-mouth-2", energy: 1, attack: 105, defend: 30, Effect: "Deal 120% damage when comboed with another 'Nut Cracker' card."),
    CardsModel(name: "Piercing Sound",parts:"mouth",_class:"beast", img: "beast-mouth-4", energy: 1, attack: 80, defend: 40, Effect: "Destoy 1 of your opponent's energy."),
    CardsModel(name: "Death Mask",parts:"mouth",_class:"beast", img: "beast-mouth-8", energy: 1, attack: 90, defend: 30, Effect: "Apply Lethal to target if this Axie's HP is below 30%."),
    CardsModel(name: "Self Rally",parts:"mouth",_class:"beast", img: "beast-mouth-10", energy: 0, attack: 0, defend: 30, Effect: "Apply 2 Morale+ to this Axie for 2 rounds."),

    //tail
    CardsModel(name: "Luna Absorb",parts:"tail",_class:"beast", img: "beast-tail-2", energy: 0, attack: 0, defend: 0, Effect: "Gain 1 energy."),
    CardsModel(name: "Night Steal",parts:"tail",_class:"beast", img: "beast-tail-4", energy: 1, attack: 80, defend: 10, Effect: "Steal 1 energy from your opponent when comboed with another card."),
    CardsModel(name: "Rampant Howl",parts:"tail",_class:"beast", img: "beast-tail-6", energy: 1, attack: 110, defend: 40, Effect: "Apply Morale+ to your team for 2 rounds if this Axie attacks while in Last Stand."),
    CardsModel(name: "Hare Dagger",parts:"tail",_class:"beast", img: "beast-tail-8", energy: 1, attack: 120, defend: 30, Effect: "Draw a card if this Axie attacks at the beginning of the round."),
    CardsModel(name: "Nut Throw",parts:"tail",_class:"beast", img: "beast-tail-10", energy: 1, attack: 105, defend: 30, Effect: "Deal 120% damage when comboed with another 'Nut Cracker' card."),
    CardsModel(name: "Gerbil Jump",parts:"tail",_class:"beast", img: "beast-tail-12", energy: 1, attack: 40, defend: 20, Effect: "Skip the closest target if there are 2 or more enemies remaining."),

    
    ////Plant
    
    //back
    CardsModel(name: "Turnip Rocket",parts:"back",_class:"plant", img: "plant-back-2", energy: 1, attack: 60, defend: 80, Effect: "Target a bird if comboed with 2 or more cards."),
    CardsModel(name: "Shroom's Grace",parts:"back",_class:"plant", img: "plant-back-4", energy: 1, attack: 0, defend: 40, Effect: "Heal this Axie for 120 HP."),
    CardsModel(name: "Cleanse Scent",parts:"back",_class:"plant", img: "plant-back-6", energy: 0, attack: 0, defend: 50, Effect: "Remove all debuffs from this Axie."),
    CardsModel(name: "Aqua Stock",parts:"back",_class:"plant", img: "plant-back-8", energy: 1, attack: 45, defend: 80, Effect: "Gain 1 energy if this Axie is struck by an Aquatic card."),
    CardsModel(name: "Refresh",parts:"back",_class:"plant", img: "plant-back-10", energy: 0, attack: 0, defend: 50, Effect: "Remove all debuffs from a teammate if its directly in front (same row) of this Axie."),
    CardsModel(name: "October Treat",parts:"back",_class:"plant", img: "plant-back-12", energy: 1, attack: 0, defend: 115, Effect: "Draw a card if this Axie's shield doesn't break this round."),

    //horn
    CardsModel(name: "Bamboo Clan",parts:"horn",_class:"plant", img: "plant-horn-2", energy: 1, attack: 80, defend: 70, Effect: "Increased 20% damage when chained with another plant card."),
    CardsModel(name: "Wooden Stab",parts:"horn",_class:"plant", img: "plant-horn-4", energy: 1, attack: 105, defend: 40, Effect: "Deal 120% damage if this Axie's shield breaks."),
    CardsModel(name: "Healing Aroma",parts:"horn",_class:"plant", img: "plant-horn-6", energy: 1, attack: 0, defend: 40, Effect: "Heal this Axie for 120 HP."),
    CardsModel(name: "Sweet Party",parts:"horn",_class:"plant", img: "plant-horn-8", energy: 2, attack: 0, defend: 0, Effect: "Heal front teammate for 270 HP. If there are no front teammates, heal this Axie instead."),
    CardsModel(name: "Prickly Trap",parts:"horn",_class:"plant", img: "plant-horn-10", energy: 1, attack: 110, defend: 20, Effect: "Deal 120% damage if this Axie attacks last."),
    CardsModel(name: "Seed Bullet",parts:"horn",_class:"plant", img: "plant-horn-12", energy: 1, attack: 30, defend: 30, Effect: "Target the fastest enemy."),

    //mouth
    CardsModel(name: "Vegetal Bite",parts:"mouth",_class:"plant", img: "plant-mouth-2", energy: 1, attack: 30, defend: 30, Effect: "Steal 1 energy from your opponent when comboed with another card."),
    CardsModel(name: "Drain Bite",parts:"mouth",_class:"plant", img: "plant-mouth-4", energy: 1, attack: 60, defend: 60, Effect: "Heal this Axie by the damage this card inflicts."),
    CardsModel(name: "Vegan Diet",parts:"mouth",_class:"plant", img: "plant-mouth-8", energy: 1, attack: 75, defend: 75, Effect: "Heal this Axie by the damage this card inflicts on a Plant target."),
    CardsModel(name: "Forest Spirit",parts:"mouth",_class:"plant", img: "plant-mouth-10", energy: 1, attack: 0, defend: 40, Effect: "Heal front teammate for 190 HP."),

    //tail
    CardsModel(name: "Carrot Hammer",parts:"tail",_class:"plant", img: "plant-tail-2", energy: 1, attack: 70, defend: 40, Effect: "Gain 1 energy if this Axie's shield breaks. Can only trigger once per round."),
    CardsModel(name: "Cattail Slap",parts:"tail",_class:"plant", img: "plant-tail-4", energy: 0, attack: 20, defend: 30, Effect: "Draw a card if struck by a Beast, Bug, or Mech card."),
    CardsModel(name: "Leek Leak",parts:"tail",_class:"plant", img: "plant-tail-6", energy: 1, attack: 60, defend: 80, Effect: "When hit, disable the attacker's ranged cards next round."),
    CardsModel(name: "Gas Unleash",parts:"tail",_class:"plant", img: "plant-tail-8", energy: 1, attack: 30, defend: 20, Effect: "Apply poison each time this card is used to attack or defend."),
    CardsModel(name: "Aqua Deflect",parts:"tail",_class:"plant", img: "plant-tail-10", energy: 1, attack: 70, defend: 80, Effect: "Cannot be targeted by Aquatic cards if this Axie has teammates remaining."),
    CardsModel(name: "Spicy Surprise",parts:"tail",_class:"plant", img: "plant-tail-12", energy: 1, attack: 90, defend: 50, Effect: "Disable target's mouth cards next round."),

    ////Bird
    
    //back
    CardsModel(name: "Ballon Pop",parts:"back",_class:"bird", img: "bird-back-2", energy: 0, attack: 0, defend: 40, Effect: "Apply Fear to target for 1 turn. If defending, apply Fear to self until next round."),
    CardsModel(name: "Heart Break",parts:"back",_class:"bird", img: "bird-back-4", energy: 1, attack: 120, defend: 20, Effect: "Apply Morale- to enemy for 2 rounds."),
    CardsModel(name: "Ill-omend",parts:"back",_class:"bird", img: "bird-back-6", energy: 1, attack: 110, defend: 30, Effect: "Apply Jinx to target for 2 rounds."),
    CardsModel(name: "Blackmail",parts:"back",_class:"bird", img: "bird-back-8", energy: 1, attack: 120, defend: 10, Effect: "Transfer all debuffs on this Axie to target."),
    CardsModel(name: "Patient Hunter",parts:"back",_class:"bird", img: "bird-back-10", energy: 1, attack: 130, defend: 0, Effect: "Target an Aquatic class enemy if this Axie's HP is below 50%"),
    CardsModel(name: "Triple Threat",parts:"back",_class:"bird", img: "bird-back-12", energy: 0, attack: 30, defend: 10, Effect: "Attack twice if this Axie has any debuffs."),

    //horn
    CardsModel(name: "Eggbomb",parts:"horn",_class:"bird", img: "bird-horn-2", energy: 1, attack: 120, defend: 0, Effect: "Apply Aroma on this Axie until next round."),
    CardsModel(name: "Cockadoodledoo",parts:"horn",_class:"bird", img: "bird-horn-4", energy: 0, attack: 0, defend: 40, Effect: "Apply Attack+ to this Axie."),
    CardsModel(name: "Air Force One",parts:"horn",_class:"bird", img: "bird-horn-6", energy: 1, attack: 120, defend: 30, Effect: "Deal 120% damage when chained with another Trump card."),
    CardsModel(name: "Headshot",parts:"horn",_class:"bird", img: "bird-horn-8", energy: 1, attack: 130, defend: 0, Effect: "Disable target's horn cards next round."),
    CardsModel(name: "Smart Shot",parts:"horn",_class:"bird", img: "bird-horn-10", energy: 1, attack: 50, defend: 10, Effect: "Skip the closest target if there are 2 or more enemies remaining."),
    CardsModel(name: "Feather Lunge",parts:"horn",_class:"bird", img: "bird-horn-12", energy: 1, attack: 100, defend: 50, Effect: "Deal 120% damage when chained with another Lunge card."),

    //mouth
    CardsModel(name: "Soothing Song",parts:"mouth",_class:"bird", img: "bird-mouth-2", energy: 1, attack: 80, defend: 0, Effect: "Apply Sleep to target."),
    CardsModel(name: "Peace Treaty",parts:"mouth",_class:"bird", img: "bird-mouth-4", energy: 1, attack: 120, defend: 30, Effect: "Apply Attack- on target."),
    CardsModel(name: "Insectivore",parts:"mouth",_class:"bird", img: "bird-mouth-8", energy: 1, attack: 110, defend: 40, Effect: "Target Bug class enemy if this Axie's HP is below 50%."),
    CardsModel(name: "Dark Swoop",parts:"mouth",_class:"bird", img: "bird-mouth-10", energy: 1, attack: 25, defend: 0, Effect: "Target fastest enemy."),

    //tail
    CardsModel(name: "Early Bird",parts:"tail",_class:"bird", img: "bird-tail-2", energy: 1, attack: 110, defend: 20, Effect: "Deal 120% damage if this Axie attacks first."),
    CardsModel(name: "Sunder Armor",parts:"tail",_class:"bird", img: "bird-tail-4", energy: 0, attack: 40, defend: 90, Effect: "Add 20% shield to this Axie for each debuff it possesses."),
    CardsModel(name: "Risky Feather",parts:"tail",_class:"bird", img: "bird-tail-6", energy: 1, attack: 150, defend: 0, Effect: "Apply 2 Attack- to this Axie."),
    CardsModel(name: "Puffy Smack",parts:"tail",_class:"bird", img: "bird-tail-8", energy: 1, attack: 100, defend: 50, Effect: "Skip targets that are in Last Stand."),
    CardsModel(name: "Cool Breeze",parts:"tail",_class:"bird", img: "bird-tail-10", energy: 1, attack: 110, defend: 30, Effect: "Apply Chill to target for 2 rounds."),
    CardsModel(name: "All-out Shot",parts:"tail",_class:"bird", img: "bird-tail-12", energy: 0, attack: 120, defend: 0, Effect: "Inflict 30% of this Axie's max HP to itself."),

    ////Bug
    
    //back
    CardsModel(name: "Sticky Goo",parts:"back",_class:"bug", img: "bug-back-2", energy: 1, attack: 40, defend: 60, Effect: "Stun attacker if this Axie’s shield breaks. Can only trigger once per round."),
    CardsModel(name: "Barb Strike",parts:"back",_class:"bug", img: "bug-back-4", energy: 1, attack: 100, defend: 50, Effect: "Apply poison to target when played in a chain."),
    CardsModel(name: "Bug Noise",parts:"back",_class:"bug", img: "bug-back-6", energy: 1, attack: 100, defend: 40, Effect: "Apply Attack- to target."),
    CardsModel(name: "Bug Splat",parts:"back",_class:"bug", img: "bug-back-8", energy: 1, attack: 110, defend: 50, Effect: "Deal 50% more damage when attacking Bug targets."),
    CardsModel(name: "Scrab Curse",parts:"back",_class:"bug", img: "bug-back-10", energy: 1, attack: 100, defend: 40, Effect: "Target cannot be healed until next round."),
    CardsModel(name: "TBuzzing Wind",parts:"back",_class:"bug", img: "bug-back-12", energy: 0, attack: 10, defend: 30, Effect: "Apply Fragile to target until next round."),

    //horn
    CardsModel(name: "Mystic Rush",parts:"horn",_class:"bug", img: "bug-horn-2", energy: 0, attack: 40, defend: 0, Effect: "Apply Speed- to target for 2 rounds."),
    CardsModel(name: "Bug Signal",parts:"horn",_class:"bug", img: "bug-horn-4", energy: 1, attack: 80, defend: 60, Effect: "Steal energy from your opponent when chained with another Bug Signal card."),
    CardsModel(name: "Grunb Surprise",parts:"horn",_class:"bug", img: "bug-horn-6", energy: 1, attack: 80, defend: 50, Effect: "Apply Fear to shielded targets."),
    CardsModel(name: "Dull Grip",parts:"horn",_class:"bug", img: "bug-horn-8", energy: 1, attack: 110, defend: 30, Effect: "Deal 30% more damage to shielded targets."),
    CardsModel(name: "Third Giance",parts:"horn",_class:"bug", img: "bug-horn-10", energy: 1, attack: 80, defend: 50, Effect: "Randomly discard 1 card from your enemy's hand."),
    CardsModel(name: "Disguise",parts:"horn",_class:"bug", img: "bug-horn-12", energy: 0, attack: 20, defend: 20, Effect: "Gain 1 energy when comboed with a plant card."),

    //mouth
    CardsModel(name: "Blood Taste",parts:"mouth",_class:"bug", img: "bug-mouth-2", energy: 1, attack: 70, defend: 40, Effect: "Heal this Axie by the damage inflicted with this card."),
    CardsModel(name: "Sunder Claw",parts:"mouth",_class:"bug", img: "bug-mouth-4", energy: 0, attack: 30, defend: 10, Effect: "Randomly discard 1 card from your enemy's hand."),
    CardsModel(name: "Terror Chomp",parts:"mouth",_class:"bug", img: "bug-mouth-8", energy: 1, attack: 120, defend: 30, Effect: "Apply Fear to target for 2 turns when played in a Chain."),
    CardsModel(name: "Mite Bite",parts:"mouth",_class:"bug", img: "bug-mouth-10", energy: 0, attack: 30, defend: 0, Effect: "Add 100% more damage when comboed with another card."),

    //tail
    CardsModel(name: "Chemical Warfare",parts:"tail",_class:"bug", img: "bug-tail-2", energy: 1, attack: 30, defend: 40, Effect: "Apply Stench to enemy for 1 round."),
    CardsModel(name: "Twin Needle",parts:"tail",_class:"bug", img: "bug-tail-4", energy: 0, attack: 30, defend: 0, Effect: "Attack twice when comboed with another card."),
    CardsModel(name: "Anesthetic Balt",parts:"tail",_class:"bug", img: "bug-tail-6", energy: 1, attack: 60, defend: 80, Effect: "Apply stun when struck by Aquatic or Bird class cards. Can only trigger once per round."),
    CardsModel(name: "Numbering Lecretion",parts:"tail",_class:"bug", img: "bug-tail-8", energy: 1, attack: 30, defend: 40, Effect: "Disable target's melee cards next round."),
    CardsModel(name: "Grub Explode",parts:"tail",_class:"bug", img: "bug-tail-10", energy: 0, attack: 60, defend: 0, Effect: "Deal 200% damage when attacking in Last stand. Axie's Last Stand ends after it attacks."),
    CardsModel(name: "Allergic Reaction",parts:"tail",_class:"bug", img: "bug-tail-12", energy: 1, attack: 110, defend: 30, Effect: "Deal 130% damage to debuffed targets."),
    
    ////Reptile
    
    //back
    CardsModel(name: "Ivory Chop",parts:"back",_class:"reptile", img: "reptile-back-2", energy: 1, attack: 80, defend: 80, Effect: "Draw a card if this Axie's shield breaks."),
    CardsModel(name: "Spike Throw",parts:"back",_class:"reptile", img: "reptile-back-4", energy: 1, attack: 80, defend: 50, Effect: "Target enemy with lowest shield when comboed with 2 or more cards."),
    CardsModel(name: "Vine Dagger",parts:"back",_class:"reptile", img: "reptile-back-6", energy: 0, attack: 20, defend: 30, Effect: "Double shield from this card when comboed with a plant card."),
    CardsModel(name: "Bulkwark",parts:"back",_class:"reptile", img: "reptile-back-8", energy: 1, attack: 20, defend: 80, Effect: "Reflect 40% of melee damage back at attacker."),
    CardsModel(name: "Slippery Shield",parts:"back",_class:"reptile", img: "reptile-back-10", energy: 1, attack: 10, defend: 135, Effect: "Add 15% of this Axie's shield to adjacent teammates."),
    CardsModel(name: "Nile Strike",parts:"back",_class:"reptile", img: "reptile-back-12", energy: 1, attack: 90, defend: 60, Effect: "Appy Speed- to target for 2 rounds."),

    //horn
    CardsModel(name: "Poo Fling",parts:"horn",_class:"reptile", img: "reptile-horn-2", energy: 1, attack: 30, defend: 40, Effect: "Apply Stench to target until end of round."),
    CardsModel(name: "Scaly Lunge",parts:"horn",_class:"reptile", img: "reptile-horn-4", energy: 1, attack: 100, defend: 50, Effect: "Deal 120% damage when chained with another lunge card."),
    CardsModel(name: "Surprise Invasion",parts:"horn",_class:"reptile", img: "reptile-horn-6", energy: 1, attack: 80, defend: 60, Effect: "Deal 130% damage if target is faster than this Axie."),
    CardsModel(name: "Tiny Catapult",parts:"horn",_class:"reptile", img: "reptile-horn-8", energy: 1, attack: 80, defend: 40, Effect: "Reflect 50% of ranged damage back at attacker."),
    CardsModel(name: "Diarm",parts:"horn",_class:"reptile", img: "reptile-horn-10", energy: 1, attack: 100, defend: 40, Effect: "Apply Speed- to attacker for 2 rounds."),
    CardsModel(name: "Overgrow Keratin",parts:"horn",_class:"reptile", img: "reptile-horn-12", energy: 1, attack: 80, defend: 20, Effect: "Recover 20 shield per turn."),

    //mouth
    CardsModel(name: "Sneaky Raid",parts:"mouth",_class:"reptile", img: "reptile-mouth-2", energy: 1, attack: 20, defend: 40, Effect: "Target the furthest enemy."),
    CardsModel(name: "Kotaro bite",parts:"mouth",_class:"reptile", img: "reptile-mouth-4", energy: 1, attack: 80, defend: 20, Effect: "Gain 1 energy if target is faster than this Axie."),
    CardsModel(name: "Why So Serios",parts:"mouth",_class:"reptile", img: "reptile-mouth-8", energy: 1, attack: 90, defend: 50, Effect: "Heal this Axie by damage inflicted with this card to Aquatic targets."),
    CardsModel(name: "Chomp",parts:"mouth",_class:"reptile", img: "reptile-mouth-10", energy: 1, attack: 80, defend: 50, Effect: "Apply Stun to enemy when comboed with at least 2 additional cards."),

    //tail
    CardsModel(name: "Critical Escape",parts:"tail",_class:"reptile", img: "reptile-tail-2", energy: 1, attack: 90, defend: 10, Effect: "Reduce damage taken by 15% this round."),
    CardsModel(name: "Scale Dart",parts:"tail",_class:"reptile", img: "reptile-tail-4", energy: 1, attack: 90, defend: 60, Effect: "Generate 1 energy when attacking a buffed target."),
    CardsModel(name: "Tiny Swing",parts:"tail",_class:"reptile", img: "reptile-tail-6", energy: 1, attack: 80, defend: 40, Effect: "Deal 150% damage after round 4."),
    CardsModel(name: "Jar Barrage",parts:"tail",_class:"reptile", img: "reptile-tail-8", energy: 1, attack: 80, defend: 20, Effect: "Attacks that break this Axie’s shield cannot do additional damage. Can only trigger once per round."),
    CardsModel(name: "Neuro Toxin",parts:"tail",_class:"reptile", img: "reptile-tail-10", energy: 1, attack: 100, defend: 50, Effect: "Apply Attack- to poisoned targets."),
    CardsModel(name: "Venom Spray",parts:"tail",_class:"reptile", img: "reptile-tail-12", energy: 0, attack: 10, defend: 20, Effect: "Apply Poison to target."),

]
