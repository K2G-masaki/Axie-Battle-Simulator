//
//  ContentView.swift
//  Axie Battle Simulator
//
//  Created by masaki on 2021/11/01.
//

import SwiftUI

var device = UIDevice.current.userInterfaceIdiom
var maxheight = UIScreen.main.bounds.height
var maxwidth = UIScreen.main.bounds.width

struct ContentView: View {
    
    @AppStorage("stored_Userid") var Stored_Userid = ""
    
    @ObservedObject public var userData = User()
    @State var Transition = "LP"
    
    var body: some View {
        
        ZStack{
            
            switch Transition {
                
                case "AxieBody" :AxieBody().transition(.scale)
                    .environmentObject(userData)
                        
                default : LPView()
                        .onAppear(perform: {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                                withAnimation(){
                                    Transition = "AxieBody"
                                    if Stored_Userid.isEmpty {
                                        Stored_Userid = UUID().uuidString
                                    }
                                }
                            }
                        })
                        .transition(.scale)
            }
        }
        .transition(.scale)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(User())
    }
}

struct LPView : View {
    
    var body : some View {
        
        NavigationView {
            
        ZStack {
            
            Color("bg")

            VStack{
                
                Spacer()
                
                Text("Axie Battle Simulator")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top)
                
                NavigationLink(destination: Cards()){
                    
                GifImage("ronin")
                    .clipShape(Circle())
                    .frame(width : maxwidth/2, height: maxheight/3.5)
                }
                
                Spacer()
                
            }
            
            VStack{
                Spacer()
                    .frame(height : maxheight/1.6)
                LottieView(filename: "load", loop: .loop)
            }
            
        }
        .edgesIgnoringSafeArea(.all)
        .frame(maxWidth : .infinity, maxHeight: .infinity)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
    }
    
}
