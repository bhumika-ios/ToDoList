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
        .font(.title)
        .padding(.vertical, 8)
    }
}

    //MARK: - Preview
struct ListRowView_Previews: PreviewProvider{
    static var data1 = DataModel(title: "First Data!", isCompleted: false)
    static var data2 = DataModel(title: "Second Data!", isCompleted: true)
    static var previews: some View {
        Group {
            ListRowView(data: data1)
            ListRowView(data: data2)
        }
        .previewLayout(.sizeThatFits)
    }
    
    
}
