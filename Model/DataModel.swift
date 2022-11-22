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
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString ,title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    
    func updateCompletion() -> DataModel {
        return DataModel(title: self.title, isCompleted: !self.isCompleted)
    }
}
