//
//  Simulation.swift
//  Axie Battle Simulator
//
//  Created by masaki on 2021/11/02.
//

import SwiftUI

struct Simulation: View {
    
    @State var offset : CGFloat = 0
    @State var upper : CGFloat = 400
    
    @State var energy = 0
    
    var body: some View {
        
        NavigationView{
            
            ZStack{
                
                Color("bg")
                    .edgesIgnoringSafeArea(.all)
                
                
                VStack{
                    
                    Text("Battle Simulation")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top)
                    
                    VStack{
                    Image("Aqu")
                        .resizable()
                        .scaledToFill()
                        .frame(width:120,height:30)
                    
                    HStack{
                        Image("Reptil")
                            .resizable()
                            .scaledToFill()
                            .frame(width:120,height:30)
                        
                        Spacer()
                        
                        Image("Beast")
                            .resizable()
                            .scaledToFill()
                            .frame(width:120,height:30)
                        
                    }
                    .padding(.horizontal,10)
                    
                    Image("Plan")
                        .resizable()
                        .scaledToFill()
                        .frame(width:120,height:30)
                    
                    HStack{
                        Image("Dus")
                            .resizable()
                            .scaledToFill()
                            .frame(width:120,height:30)
                        
                        Spacer()
                        
                        Image("Mech")
                            .resizable()
                            .scaledToFill()
                            .frame(width:120,height:30)
                        
                    }
                    .padding(.horizontal,10)
                    
                    Image("Bird")
                        .resizable()
                        .scaledToFill()
                        .frame(width:120,height:30)
                    
                    }
                    .padding(.top)
                    
                    Divider()
                        .padding(.vertical)
                    
                    VStack{
//                       
                    
//                    HStack{
//                        Image("Aqa")
//                            .resizable()
//                            .scaledToFill()
//                            .frame(width:120,height:30)
//
//                        Spacer()
//
//                        Image("Aqa")
//                            .resizable()
//                            .scaledToFill()
//                            .frame(width:120,height:30)
                        
//                    }
//                    .padding(.horizontal,10)
                    
                    Image("Plnt")
                        .resizable()
                        .scaledToFill()
                        .frame(width:120,height:30)
                    
                    HStack{
                        Image("Aqua")
                            .resizable()
                            .scaledToFill()
                            .frame(width:120,height:30)
                        
                        Spacer()
                        
                        Image("Aqua")
                            .resizable()
                            .scaledToFill()
                            .frame(width:120,height:30)
                        
                    }
                    .padding(.horizontal,10)
                    
                    Image("Bird")
                        .resizable()
                        .scaledToFill()
                        .frame(width:120,height:30)
                    
                    }
                    
                    Divider()
                        .padding(.vertical)
                    
                    Spacer()
                    
                    HStack{
                        Text("Your Cards")
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text("Energy \(energy) / 10")
                            .fontWeight(.semibold)
                    }
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal,showsIndicators: false){
                        
                        HStack{
                            
                            ForEach(cards){ card in
                                
                                Image(card.img)
                                    .resizable()
                                    .scaledToFit()
                            }
                            .frame(height:100)
                            .padding(.leading,10)
                            
                        }
                        
                    }
                    
                    HStack{
                        Spacer()
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .bold()
                            .padding(10)
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    .padding(.trailing)
                    
                    Spacer()
                    
                }
                
                
                
                
                
                
//                GeometryReader{
//                    geometry in
//                    BottomSheet(value : (-geometry.frame(in: .global).height + 150))
//                        .offset(y: geometry.frame(in: .global).height - (maxheight < 800 ? 100 : 70))
//                        .offset(y: offset)
//                        .gesture(DragGesture().onChanged({ (value) in
//
//                            withAnimation{
//
//                                // checking the direction of scroll....
//
//                                // scrolling upWards....
//                                // using startLocation bcz translation will change when we drag up and down....
//
//                                if value.startLocation.y > geometry.frame(in: .global).midX{
//
//                                    if value.translation.height < 0 && offset > (-geometry.frame(in: .global).height + upper){
//
//                                        offset = value.translation.height
//                                    }
//                                }
//
//                                if value.startLocation.y < geometry.frame(in: .global).midX{
//
//                                    if value.translation.height > 0 && offset < 0{
//
//                                        offset = (-geometry.frame(in: .global).height + upper) + value.translation.height
//                                    }
//                                }
//                            }
//
//                        }).onEnded({ (value) in
//
//                            withAnimation{
//
//                                // checking and pulling up the screen...
//
//                                if value.startLocation.y > geometry.frame(in: .global).midX{
//
//                                    if -value.translation.height > geometry.frame(in: .global).midX{
//
//                                        offset = (-geometry.frame(in: .global).height + upper)
//
//                                        return
//                                    }
//
//                                    offset = 0
//                                }
//
//                                if value.startLocation.y < geometry.frame(in: .global).midX{
//
//                                    if value.translation.height < geometry.frame(in: .global).midX{
//
//                                        offset = (-geometry.frame(in: .global).height + upper)
//
//                                        return
//                                    }
//
//                                    offset = 0
//                                }
//                            }
//                        }))
//
//                }

                
                
                
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        
    }
}

struct Simulation_Previews: PreviewProvider {
    static var previews: some View {
        Simulation()
    }
}
