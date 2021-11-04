//
//  AxieBody.swift
//  Axie Battle Simulator
//
//  Created by masaki on 2021/11/02.
//

import SwiftUI

struct AxieBody: View {
    
    
    @EnvironmentObject var userData : User
    
    var width : CGFloat = maxwidth/2
    var height : CGFloat = maxheight/5
    @State var text = "\u{2022} "
    @State var tag_n = 0
    
    @State var stats_open = [false,false,false]
    
    var body: some View {
        
        NavigationView{
            
            ZStack {
                
                Color("bg")
                    .edgesIgnoringSafeArea(.all)
                
                TabView(selection : $tag_n) {
                
                    VStack(alignment : .leading) {
                        
                        Spacer()
                            .frame(height : maxheight*0.08)
                        
                        ZStack{
                            
                            Text("Your Team")
                                .fontWeight(.black)
                                .font(.largeTitle)
                                .frame(width : maxwidth, alignment : .center)
                            
                            HStack{
                                
                            Spacer()
                                
                            Button(action: {
                                withAnimation(){
                                tag_n = 1
                                }
                            }){
                                Image(systemName: "chevron.forward.2")
                                    .foregroundColor(.black)
                            }
                            .padding(.trailing)
                            .padding(.trailing)
                            }
                        }
                        
                        ScrollView(.vertical){
                        ForEach(userData.MyTeam,id:\.id){ axie in
                            
                            HStack{
                                
                                VStack{
                                    
                                    NavigationLink(destination : Class(edit_n : userData.MyTeam.compactMap({$0.id}).firstIndex(of:axie.id)! ,mine : true)){
                                    Image(axie.body)
                                        .resizable()
                                        .scaledToFit()
                                        .offset(y:10)
                                    }
                                    HStack(spacing:10){
                                    Text(axie.body)
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .padding(8)
                                        .foregroundColor(.white)
                                        .background(axie_color[axie.body])
                                        .cornerRadius(10)
                                        
                                        Button(action:{
                                            withAnimation(){
                                            stats_open[userData.MyTeam.compactMap({$0.id}).firstIndex(of:axie.id)!].toggle()
                                            }
                                        }){
                                            Text("▼ stats")
                                                .font(.caption)
                                                .foregroundColor(.black)
                                        }
                                    }
                                    .padding(.bottom)
                                    
                                }
                                .frame(width:width,height:height)
                                
                                VStack(alignment : .leading, spacing : 10){
                                    
                                    ForEach(axie.cards,id:\.self) { card in

                                        HStack{

                                            Text(text)
                                                .fontWeight(.black)

                                            Text(card)
                                                .fontWeight(.semibold)

                                            Spacer()
                                            
                                            let index = cards.compactMap({$0.name}).firstIndex(of: card)
                                            
                                            let parts = cards.compactMap({$0.parts})[index!]

                                            NavigationLink(destination : Cards(filter : parts, edit_n : userData.MyTeam.compactMap({$0.id}).firstIndex(of:axie.id)!)){
                                                Image(systemName: "chevron.right")
                                                    .foregroundColor(.black)
                                            }
                                            .padding(.trailing)
                                            .padding(.trailing)
                                        }

                                    }
                                    
                                }
                            }
                            
                            if stats_open[userData.MyTeam.compactMap({$0.id}).firstIndex(of:axie.id) ?? 0]{
                                
                                HStack{
                                    Spacer()
                                    Text("HP " + "\(axie.HP)")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .padding(8)
                                        .foregroundColor(.white)
                                        .background(Color.green)
                                        .cornerRadius(10)
                                    Text("Speed " + "\(axie.Speed)")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .padding(8)
                                        .foregroundColor(.white)
                                        .background(Color.yellow)
                                        .cornerRadius(10)
                                    Text("Skill " + "\(axie.Skill)")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .padding(8)
                                        .foregroundColor(.white)
                                        .background(Color.purple)
                                        .cornerRadius(10)
                                    Text("Morale " + "\(axie.Morale)")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .padding(8)
                                        .foregroundColor(.white)
                                        .background(Color.red)
                                        .cornerRadius(10)
                                    
                                    Spacer()
                                }
                                .padding(.bottom,5)
                            }
                            
                            Divider()
                        }
                            Spacer()
                                .frame(height : maxheight*0.1)
                        }
                    }
                    .frame(width : maxwidth, alignment : .leading)
                    .tag(0)
                    
                    
                    VStack(alignment : .leading) {
                        
                        Spacer()
                            .frame(height : maxheight*0.08)
                        
                        ZStack{
                            Text("Opponent Team")
                                .fontWeight(.black)
                                .font(.largeTitle)
                                .frame(width : maxwidth, alignment : .center)
                            
                            HStack{
                                
                            
                                
                            Button(action: {
                                withAnimation(){
                                tag_n = 0
                                }
                            }){
                                Image(systemName: "chevron.backward.2")
                                    .foregroundColor(.black)
                            }
                            .padding(.leading)
                                
                                Spacer()
                            }
                        }
                        
                        ScrollView(.vertical){
                        ForEach(userData.OppTeam,id:\.id){ axie in
                            
                            HStack{
                                
                                VStack{
                                    
                                    NavigationLink(destination : Class(edit_n : userData.OppTeam.compactMap({$0.id}).firstIndex(of:axie.id)!,mine : false)){
                                    Image(axie.body)
                                        .resizable()
                                        .scaledToFit()
                                        .offset(y:10)
                                    }
                                    HStack(spacing:10){
                                    Text(axie.body)
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .padding(8)
                                        .foregroundColor(.white)
                                        .background(axie_color[axie.body])
                                        .cornerRadius(10)
                                        
                                        Button(action:{
                                            withAnimation(){
                                            stats_open[userData.OppTeam.compactMap({$0.id}).firstIndex(of:axie.id)!].toggle()
                                            }
                                        }){
                                            Text("▼ stats")
                                                .font(.caption)
                                                .foregroundColor(.black)
                                        }
                                    }
                                    .padding(.bottom)
                                    
                                }
                                .frame(width:width,height:height)
                                
                                VStack(alignment : .leading, spacing : 10){
                                    
                                    ForEach(axie.cards,id:\.self) { card in
                                        
                                        HStack{
                                            
                                            Text(text)
                                                .fontWeight(.black)
                                            
                                            Text(card)
                                                .fontWeight(.semibold)
                                            
                                            Spacer()
                                            
                                            let index = cards.compactMap({$0.name}).firstIndex(of: card)
                                            
                                            let parts = cards.compactMap({$0.parts})[index!]
                                            
                                            NavigationLink(destination : Cards(filter : parts)){
                                                Image(systemName: "chevron.right")
                                                    .foregroundColor(.black)
                                            }
                                            .padding(.trailing)
                                            .padding(.trailing)
                                        }
                                        
                                    }
                                    
                                }
                            }
                            
                            if stats_open[userData.OppTeam.compactMap({$0.id}).firstIndex(of:axie.id)!]{
                                HStack{
                                    Spacer()
                                    Text("HP " + "\(axie.HP)")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .padding(8)
                                        .foregroundColor(.white)
                                        .background(Color.green)
                                        .cornerRadius(10)
                                    Text("Speed " + "\(axie.Speed)")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .padding(8)
                                        .foregroundColor(.white)
                                        .background(Color.yellow)
                                        .cornerRadius(10)
                                    Text("Skill " + "\(axie.Skill)")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .padding(8)
                                        .foregroundColor(.white)
                                        .background(Color.purple)
                                        .cornerRadius(10)
                                    Text("Morale " + "\(axie.Morale)")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .padding(8)
                                        .foregroundColor(.white)
                                        .background(Color.red)
                                        .cornerRadius(10)
                                    
                                    Spacer()
                                }
                                .padding(.bottom,5)
                            }
                            
                            Divider()
                        }
                            Spacer()
                                .frame(height : maxheight*0.1)
                        }
                        
                    }
                    .frame(width : maxwidth, alignment : .leading)
                    .tag(1)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    
                VStack{
                    Spacer()

                    HStack{

                        Button(action:{}){

                            VStack{

                                Image(systemName: "dollarsign.circle.fill")
                                    .font(.system(size: maxwidth/10))
                                    .foregroundColor(Color("Point"))

                                Text("Donation❤︎")
                                    .font(.caption2)
                                    .bold()
                                    .foregroundColor(.black)
                            }

                        }
                        
                        
                       

                        Spacer()
                    }
                }
                .padding(.horizontal,10)
                .frame(width : maxwidth, alignment : .leading)
                .padding(.bottom,5)
                
                VStack{
                    Spacer()

                    HStack{
                        
                        Button(action:{}){
                        Text("Start Simulation")
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

struct AxieBody_Previews: PreviewProvider {
    static var previews: some View {
        AxieBody().environmentObject(User())
    }
}
