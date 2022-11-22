//
//  HomeScreen.swift
//  ToDoList
//
//  Created by Bhumika Patel on 22/11/22.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        ScrollView{
            VStack{
                Text("There are no Data!")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.semibold)
                Text("Are you a productive person? I think you should click the add button and add a bunch of items to your todo list!")
                    .font(.system(.headline))
                    .padding(.bottom, 20)
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
