//
//  BottomSheet.swift
//  Axie Battle Simulator
//
//  Created by masaki on 2021/11/02.
//

import SwiftUI

struct BottomSheet: View {
    
    var value : CGFloat
    
    var body: some View {
        VStack{
            
            Capsule()
                .fill(Color.gray.opacity(0.5))
                .frame(width: 150, height: 5)
                .padding(.top)
                .padding(.bottom,10)
            
            
            HStack{
                Spacer()
                HStack{
                    
                    Text("Cards")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    
                }
                .padding()
                .offset(y: maxheight < 800 ? -5 : -10)
                Spacer()
            }
            
            
            ScrollView(.horizontal,showsIndicators: false){
                
                HStack{
                    
                    ForEach(cards){ card in
                        
                        Image(card.img)
                            .resizable()
                            .scaledToFit()
                    }
                    .frame(height:150)
                    .padding(.leading,10)
                    
                }
                
            }
            
            HStack{
                
                Spacer()
                
                Text("End Turn")
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding(.top,10)
            .padding(.trailing)
            
            Spacer()
        }
        .background(BlurView(style: .systemMaterialLight))
        .background(Color("bar"))
        .cornerRadius(40)
        .frame(height : 1000)
    }
}

struct BlurView : UIViewRepresentable {
    
    var style : UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView{
        
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
        
    }
}
