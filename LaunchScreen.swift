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
//struct LiquidSwipe: Shape {
//    func path(in rect: CGRect) -> Path{
//        return Path{}
//    }
//}
