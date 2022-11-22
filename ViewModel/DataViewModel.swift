//
//  DataViewModel.swift
//  ToDoList
//
//  Created by Bhumika Patel on 22/11/22.
//

import Foundation

final class DataViewModel: ObservableObject{
    //MARK: - Variables
    @Published var data: [DataModel] = [] {
//        didSet {
//            saveItems()
//        }
    }
    private let itemsKey: String = "items_list"
}
