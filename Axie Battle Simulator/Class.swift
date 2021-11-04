//
//  Class.swift
//  Axie Battle Simulator
//
//  Created by masaki on 2021/11/02.
//

import SwiftUI

var axies = ["Aqua","Beast","Reptile","Bird","Plant","Bug","Dawn","Mech","Dusk"]
var axie_color = ["Aqua" : Color.blue,"Beast" : Color.yellow,"Reptile" : Color.purple,"Bird" : Color.pink,"Plant" : Color.green,"Bug" : Color("attack"),"Dawn": Color("bar"),"Mech" : Color.gray,"Dusk" : Color("Point")]

struct Class: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var userData : User
    @State var edit_n = 0
    @State var tag_n = 0
    @State var mine = true
    @State var _class = ""
    @State var eyes = ""
    @State var ears = ""
    
    var body: some View {
        
        NavigationView(){
            
        
        ZStack{
            
            Color("bg")
                .edgesIgnoringSafeArea(.all)
            
            TabView(selection : $tag_n) {
                SelectClass(tag_n : $tag_n, _class : $_class)
                    .tag(0)
                SelectParts(eyes: $eyes, ears: $ears)
                    .tag(1)

            }
            .foregroundColor(.black)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            VStack{
                
                Spacer()
                
                HStack{
                    
                    Button(action:{
                        
                        userData.UpdateAxie(mine : mine,index: edit_n, _class: _class, eyes: eyes, ears: ears)
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                        
                    }){
                        
                        Text("Finish Setting")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .font(.system(size: maxwidth/10))
                            .padding()
                            .foregroundColor(.black)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white)
                            )
                            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("Point"),lineWidth: 1))
                    }
                }
            }
            .padding(.horizontal,10)
            .frame(width : maxwidth, alignment : .center)
            .padding(.bottom)
            
        }
        .navigationBarHidden(true)
        }
        
    }
}

struct Class_Previews: PreviewProvider {
    static var previews: some View {
        Class().environmentObject(User())
    }
}

struct SelectClass : View {
    
    @Binding var tag_n : Int
    @Binding var _class : String
    
    var body: some View {
        
        VStack{
            
            Text("Select Class")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            
            LazyVGrid(columns: Array(repeating :GridItem(.flexible(minimum:15)),count: 3), spacing :5, pinnedViews:[])  // 固定する方を指定
            {
                ForEach(axies,id:\.self){axie in
                    
                    Button(action : {
                        withAnimation(){
                            tag_n = 1
                            _class = axie
                        }
                    }){
                    VStack{
                        Image(axie)
                            .resizable()
                            .scaledToFill()
                            
                        
                        Text(axie)
                            .fontWeight(.bold)
                    }
                    }
                    
                }
                .frame(width:100,height:120)
            }
            
            Spacer()
            
        }
        .frame(height : maxheight/1.5)
    }
}

struct SelectParts : View {
    
    @Binding var eyes : String
    @Binding var ears : String
    
    var bonus_3 = ["Aqua": "Speed", "Beast" : "Morale", "Bird" : "Speed", "Bug" : "Morale", "Plant" : "HP", "Reptile" : "HP"]
    var bonus_1 = ["Aqua": "HP", "Beast" : "Speed", "Bird" : "Morale", "Bug" : "HP", "Plant" : "Morale", "Reptile" : "Speed"]
    
    var body: some View {
        
        VStack{
            
            Text("Select 2 Parts")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.top)
            
            ScrollView(.vertical){
            
                VStack{
                    
                    Text("Eyes")
                        .font(.title3)
                        .fontWeight(.semibold)
            LazyVGrid(columns: Array(repeating :GridItem(.flexible(minimum:10)),count: 3), spacing :10, pinnedViews:[])  // 固定する方を指定
            {
                ForEach(axies,id:\.self){axie in
                    
                    if axie != "Dusk" && axie != "Dawn" && axie != "Mech" {
                        VStack{
                            
                            Button(action : {
                                eyes = axie.lowercased()
                            }){
                                VStack{
                                    Image(axie.lowercased())
                                    .resizable()
                                    .scaledToFit()
                                    
                                Text(axie)
                                    .fontWeight(.bold)
                                }
                            }
                                
                            VStack(alignment : .leading){
                                
                                Text("+3 " + bonus_3[axie]!)
                                
                                Text("+1 " + bonus_1[axie]!)
                                
                            }
                            .padding(.top,5)
                        }
                        .frame(width:150,height:150)
                    }
                }
            }
                    
                }
                
            Divider()
                .padding(.vertical,10)
                
                VStack{
                    
                    Text("Ears")
                        .font(.title3)
                        .fontWeight(.semibold)
                
                LazyVGrid(columns: Array(repeating :GridItem(.flexible(minimum:10)),count: 3), spacing :10, pinnedViews:[])  // 固定する方を指定
                {
                    ForEach(axies,id:\.self){axie in
                        
                        if axie != "Dusk" && axie != "Dawn" && axie != "Mech" {
                            VStack{
                                
                                Button(action : {
                                    ears = axie.lowercased()
                                }){
                                    VStack{
                                        Image(axie.lowercased())
                                        .resizable()
                                        .scaledToFit()
                                        
                                    Text(axie)
                                        .fontWeight(.bold)
                                    }
                                }
                                    
                                VStack(alignment : .leading){
                                    
                                    Text("+3 " + bonus_3[axie]!)
                                    
                                    Text("+1 " + bonus_1[axie]!)
                                    
                                }
                                .padding(.top,5)
                            }
                            .frame(width:150,height:150)
                        }
                    }
                }
                
                }
                
                Spacer()
                    .frame(height : maxheight*0.2)
            }
        }
    }
}
