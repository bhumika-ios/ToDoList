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
    @StateObject var dataViewModel = DataViewModel()
    @State var showHome = false
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
                            let screen = UIScreen.main.bounds
                            withAnimation(.spring()){
                                //validating
                                if -offset.width > screen.width / 2{
                                    //removing view...
                                    offset.width = -screen.height
                                    showHome .toggle()
                                }else{
                                    offset = .zero
                                }
                                
                            }
                        }))
                        .offset(x: 20, y :45)
                    //hiding while dragging starts...
                        .opacity(offset == .zero ? 1 : 0)
                    
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
            if showHome{
                NavigationView{
                    ListView()
                    
                    
//                        .onTapGesture {
//                            withAnimation(.spring()){
//                                offset = .zero
//                                showHome.toggle()
//                            }
//                        }
                }
                .navigationViewStyle(.stack)
                .environmentObject(dataViewModel)
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
    //animating Path...
    var animatableData: CGSize.AnimatableData{
        get{return offset.animatableData}
        set{offset.animatableData = newValue}
    }
    func path(in rect: CGRect) -> Path{
        return Path{path in
            //when user moves left...
            //increasing size both in top and bottom...
            //so it will create a liquidswipe effect..
            let width = rect.width + (-offset.width > 0 ? offset.width : 0)
            //first constructing rectangle shape..
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            //now constructing curve shape...
            
                //from
            let from = 80 + (offset.width)
            path.move(to: CGPoint(x: rect.width, y: from > 80 ? 80 : from))
            //also add height
            var to = 180 + (offset.height) + (-offset.width)
            to = to < 180 ? 180 : to
            
            //mid betwween 80-180..
            let mid : CGFloat = 80 + ((180 - 80) / 2)
            
            path.addCurve(to: CGPoint(x: rect.width, y: to), control1: CGPoint(x: width - 50, y: mid), control2: CGPoint(x: width - 50, y: mid))
        }
    }
}
