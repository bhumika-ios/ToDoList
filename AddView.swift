//
//  AddView.swift
//  ToDoList
//
//  Created by Bhumika Patel on 22/11/22.
//

import SwiftUI

struct AddView: View {
    //MARK: - Variables
    @State private var textFieldText: String = ""
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(uiColor: .systemGray5))
                    .cornerRadius(10)
                
                Button {
                    //self.saveButtonPressed()
                } label: {
                    Text("save".uppercased())
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
                
            }
            .padding(14)
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
