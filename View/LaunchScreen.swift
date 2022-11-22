//
//  LaunchScreen.swift
//  ToDoList
//
//  Created by Bhumika Patel on 22/11/22.
//

import SwiftUI

struct LaunchScreen: View {
    var body: some View {
        
        ZStack{
            Color("Green")
                .clipShape(LiquidSwipe())
                .edgesIgnoringSafeArea(.all)
            
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
    func path(in rect: CGRect) -> Path{
        return Path{path in
            let width = rect.width
            //first constructing rectangle shape..
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            //now constructing curve shape...
            
                //from
            
            path.move(to: CGPoint(x: width, y: 80))
            
            //mid betwween 80-180..
            let mid : CGFloat = 80 + ((180 - 80) / 2)
            path.addCurve(to: CGPoint(x: width, y: 180), control1: CGPoint(x: width - 50, y: mid), control2: CGPoint(x: width - 50, y: mid))
        }
    }
}
