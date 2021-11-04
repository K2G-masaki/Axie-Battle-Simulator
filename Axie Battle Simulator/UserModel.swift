//
//  UserModel.swift
//  Axie Battle Simulator
//
//  Created by masaki on 2021/11/03.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift


struct AxieModel : Codable, Identifiable, Hashable {
    
    @DocumentID var id : String?
    var userid : String
    var body : String
    var parts : Dictionary<String,String>
    var cards : Array<String>
    var HP : Int
    var Speed : Int
    var Skill : Int
    var Morale : Int
    var Buff : Dictionary<String,String>
    
    enum CodingKeys : CodingKey {
        case id
        case userid
        case body
        case parts
        case cards
        case HP
        case Speed
        case Skill
        case Morale
        case Buff
    }
    
}


struct CardsModel : Codable, Identifiable, Hashable {
    
    @DocumentID var id : String?
    var name : String
    var parts : String
    var _class : String
    var img : String
    var energy : Int
    var attack : Int
    var defend : Int
    var Effect : String
    
    enum CodingKeys : CodingKey {
        case id
        case name
        case parts
        case _class
        case img
        case energy
        case attack
        case defend
        case Effect
    }
}

class User : ObservableObject {
    
    @AppStorage("stored_Userid") var Stored_Userid = ""
    
    @Published var MyTeam : [AxieModel] = []
    @Published var OppTeam : [AxieModel] = []
    
    let ref = Firestore.firestore()
    
    init(){
        
        self.ReadAxie()
//        if MyTeam.count == 0 {
            let back = CardsModel(id : UUID().uuidString, name: "Shelter",parts:"back",_class:"aqua", img: "aquatic-back-2", energy: 1, attack: 0, defend: 115, Effect: "Disable critical strikes on this Axie during this round")
            let horn = CardsModel(id : UUID().uuidString, name: "Shell Jap",parts:"horn",_class:"aqua", img: "aquatic-horn-2", energy: 1, attack: 100, defend: 50, Effect: "Deal 130% damage when attacking an idle target.")
            let mouth = CardsModel(id : UUID().uuidString, name: "Angry Lam",parts:"mouth",_class:"aqua", img: "aquatic-mouth-2", energy: 1, attack: 110, defend: 40, Effect: "Deal 120% damage if this Axie's HP is below 50%.")
            let tail = CardsModel(id : UUID().uuidString, name: "Upstream Swim",parts:"tail",_class:"aqua", img: "aquatic-tail-2", energy: 1, attack: 110, defend: 30, Effect: "Apply Speed+ to this Axie for 2 rounds when comboed with another Aquatic _class card.")
//
        let axie = AxieModel(id : UUID().uuidString, userid : Stored_Userid, body : "Aqua", parts: ["eyes":"aqua","ears":"aqua"], cards: [back.name,horn.name,mouth.name,tail.name], HP: 0, Speed: 0, Skill: 0, Morale: 0, Buff: [:])
//        let axie2 = AxieModel(id : UUID().uuidString,body : "Beast", parts: ["eyes":"aqua","ears":"aqua"], cards: [back.name,horn.name,mouth.name,tail.name], HP: 0, Speed: 0, Skill: 0, Morale: 0, Buff: [:])
//        let axie3 = AxieModel(id : UUID().uuidString,body : "Mech", parts: ["eyes":"aqua","ears":"aqua"], cards: [back.name,horn.name,mouth.name,tail.name], HP: 0, Speed: 0, Skill: 0, Morale: 0, Buff: [:])
//
//        MyTeam.append(axie)
//        MyTeam.append(axie2)
//        MyTeam.append(axie3)
//
//
//        OppTeam.append(axie)
//        OppTeam.append(axie2)
//        OppTeam.append(axie3)
//
//        }
    }
    
    func ReadAxie(){
        ref.collectionGroup("MyAxies")
            .whereField("userid", isEqualTo: Stored_Userid)
            .getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                    }
                    else {
                        for document in querySnapshot!.documents {
                            let data = try! document.data(as : AxieModel.self)
                            if !self.MyTeam.compactMap({$0.id}).contains(data?.id){
                                self.MyTeam.append(data!)
                            }
                        }
                    }
            }
    }
    
    func UpdateAxie(mine : Bool, index : Int, _class : String, eyes : String, ears : String) {
        if mine {
            MyTeam[index].body = _class
            MyTeam[index].parts["eyes"] = eyes
            MyTeam[index].parts["ears"] = ears
            
        }
        
        else {
            OppTeam[index].body = _class
            OppTeam[index].parts["eyes"] = eyes
            OppTeam[index].parts["ears"] = ears
        }
        
        UpdateStat(mine : mine, index: index)
        
    }
    
    func UpdateStat(mine : Bool, index : Int) {
        
        let _class = self.MyTeam[index].body
        let eyes = self.MyTeam[index].parts["eyes"]
        let ears = self.MyTeam[index].parts["ears"]
        let _cards = self.MyTeam[index].cards
        
        var HP = 0
        var Speed = 0
        var Skill = 0
        var Morale = 0
        
        switch _class {
            case "Aqua":
                HP = 39
                Speed = 39
                Skill = 35
                Morale = 27
            case "Beast" :
                HP = 31
                Speed = 35
                Skill = 31
                Morale = 43
            case "Bird" :
                HP = 27
                Speed = 43
                Skill = 35
                Morale = 35
            case "Bug" :
                HP = 35
                Speed = 31
                Skill = 35
                Morale = 39
            case "Plant" :
                HP = 43
                Speed = 31
                Skill = 31
                Morale = 35
            case "Reptile" :
                HP = 39
                Speed = 35
                Skill = 31
                Morale = 35
            case "Dawn" :
                HP = 35
                Speed = 35
                Skill = 39
                Morale = 31
            case "Dusk" :
                HP = 43
                Speed = 39
                Skill = 27
                Morale = 31
            case "Mech" :
                HP = 31
                Speed = 39
                Skill = 43
                Morale = 27
            
            default:
                print("Error")
        }
        
        switch eyes {
            case "aqua":
                HP += 1
                Speed += 3
            case "beast" :
                Speed += 1
                Morale += 3
            case "bird" :
                Speed += 3
                Morale += 1
            case "bug" :
                HP += 1
                Morale += 3
            case "plant" :
                HP += 3
                Morale += 1
            case "reptile" :
                HP += 3
                Speed += 1
            default:
                print("Error")
        }
        
        switch ears {
            case "aqua":
                HP += 1
                Speed += 3
            case "beast" :
                Speed += 1
                Morale += 3
            case "bird" :
                Speed += 3
                Morale += 1
            case "bug" :
                HP += 1
                Morale += 3
            case "plant" :
                HP += 3
                Morale += 1
            case "reptile" :
                HP += 3
                Speed += 1
            default:
                print("Error")
        }
        
        for card in _cards {
            
            let index = cards.compactMap({$0.name}).firstIndex(of: card)
            
            let _class = cards.compactMap({$0._class})[index!]
        
            switch _class {
                case "aqua":
                    HP += 1
                    Speed += 3
                case "beast" :
                    Speed += 1
                    Morale += 3
                case "bird" :
                    Speed += 3
                    Morale += 1
                case "bug" :
                    HP += 1
                    Morale += 3
                case "plant" :
                    HP += 3
                    Morale += 1
                case "reptile" :
                    HP += 3
                    Speed += 1
                default:
                    print("Error")
            }
            
        }

        if mine {
            MyTeam[index].HP = 150 + HP*6
            MyTeam[index].Speed = Speed
            MyTeam[index].Skill = Skill
            MyTeam[index].Morale = Morale
        }
        else {
            OppTeam[index].HP = 150 + HP*6
            OppTeam[index].Speed = Speed
            OppTeam[index].Skill = Skill
            OppTeam[index].Morale = Morale
        }
        
        let _ = try! ref.collection("Users").document(Stored_Userid).collection("MyAxies").document(MyTeam[index].id!).setData(from : MyTeam[index]) { (err) in
                if err != nil {
                    print(err?.localizedDescription)
                    return
                }
        }
    }
    
}
