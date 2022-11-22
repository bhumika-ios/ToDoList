//
//  HomeScreen.swift
//  ToDoList
//
//  Created by Bhumika Patel on 22/11/22.
//

import SwiftUI

struct HomeScreen: View {
    @State private var animate: Bool = false
    private let secondaryAccentColor = Color("SecondColor")
    var body: some View {
        ScrollView{
            VStack{
                Text("There are no Data!")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.semibold)
                Text("Are you a productive person? I think you should click the add button and add a bunch of items to your todo list!")
                    .font(.system(.headline))
                    .padding(.bottom, 20)
                NavigationLink(destination: AddView()){
                    Text("Add Something 🥳")
                        .font(.system(.headline))
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secondaryAccentColor : Color("Green"))
                        .cornerRadius(10)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -10 : .zero)
                .shadow(color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 50 : 30)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
    }
    //MARK: - Methods
    private func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                self.animate.toggle()
            }
        })
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
