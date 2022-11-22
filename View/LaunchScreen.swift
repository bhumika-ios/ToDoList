//
//  LaunchScreen.swift
//  ToDoList
//
//  Created by Bhumika Patel on 22/11/22.
//

import SwiftUI

struct LaunchScreen: View {
    // liquid swipe offset
    @State var offset: CGSize = .zero
    var body: some View {
        
        ZStack{
            Color("Green")
                .clipShape(LiquidSwipe(offset: offset))
                .edgesIgnoringSafeArea(.all)
            // arrow...
            
                .overlay(
                    Image(systemName: "chevron.left")
                        .font(.largeTitle)
                    // for draggesture to identify
                        .frame(width: 50, height: 50)
                        .contentShape(Rectangle())
                        .gesture(DragGesture().onChanged({(value) in
                            
                            // animating swipe offset...
                            withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.6, blendDuration: 0.6)){
                                offset = value.translation
                            }
                            
                        }).onEnded({ (value) in
                            withAnimation(.spring()){
                                offset = .zero
                            }
                        }))
                        .offset(x: 20, y :45)
                    
                    ,alignment: .topTrailing
                )
                .padding(.trailing)
            
            
            VStack{
                Image(systemName: "checkmark")
                    .resizable()
                    .frame(width: 100,height: 100)
                    .foregroundColor(.white)
                    .padding()
                Text("Doing Things...")
                    .font(.system(size: 26, weight: .semibold, design: .serif))
                    .foregroundColor(.white)
                   // .bold()
            }
        
        }
        
    }
      
}


struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
struct LiquidSwipe: Shape {
    //getting offset value
    var offset: CGSize
    func path(in rect: CGRect) -> Path{
        return Path{path in
            //when user moves left...
            //increasing size both in top and bottom...
            //so it will create a liquidswipe effect..
            let width = rect.width + offset.width
            //first constructing rectangle shape..
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            //now constructing curve shape...
            
                //from
            
            path.move(to: CGPoint(x: rect.width, y: 80))
            
            //mid betwween 80-180..
            let mid : CGFloat = 80 + ((180 - 80) / 2)
            path.addCurve(to: CGPoint(x: rect.width, y: 180), control1: CGPoint(x: width - 50, y: mid), control2: CGPoint(x: width - 50, y: mid))
        }
    }
}
