//
//  ListRowView.swift
//  ToDoList
//
//  Created by Bhumika Patel on 22/11/22.
//

import SwiftUI

struct ListRowView: View{
    //MARK: - Variables
    let data: DataModel
    
    
    var body: some View{
        HStack {
            Image(systemName: data.isCompleted ? "checkmark.circle": "circle")
                .foregroundColor(data.isCompleted ? .green : .red)
                
            Text(data.title)
                .strikethrough(data.isCompleted)
            
            Spacer()
        }
    }
}
