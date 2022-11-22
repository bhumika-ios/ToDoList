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
                
                Text("Add Something 🥳")
                    .font(.system(.headline))
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(animate ? secondaryAccentColor : Color.accentColor)
                    .cornerRadius(10)
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
