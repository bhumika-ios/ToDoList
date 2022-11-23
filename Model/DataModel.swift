//
//  DataModel.swift
//  ToDoList
//
//  Created by Bhumika Patel on 22/11/22.
//

import Foundation
struct DataModel: Identifiable, Codable {
    let id: String
    let title: String
    let status: String
    let date: Date
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString ,title: String,status: String,date: Date, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.status = status
        self.date = date
        self.isCompleted = isCompleted
    }
    
    
    func updateCompletion() -> DataModel {
        return DataModel(title: self.title,status: self.status,date: self.date, isCompleted: !self.isCompleted)
    }
}
