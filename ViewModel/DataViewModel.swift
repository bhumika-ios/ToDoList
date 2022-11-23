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
        didSet {
            saveData()
        }
    }
    
    private let dataKey: String = "Data_list"
    //MARK: - Init
    init() {
        getData()
    }
    //MARK: - Methods
    private func getData() {
        guard let data1 = UserDefaults.standard.data(forKey: dataKey) else { return }
        do {
            data = try JSONDecoder().decode([DataModel].self, from: data1)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func removeData(at index: IndexSet) {
        data.remove(atOffsets: index)
    }
    
    func moveData(from: IndexSet, to: Int) {
        data.move(fromOffsets: from, toOffset: to)
    }
    
    func addData(title: String, status: String, date: Date) {
        let newData = DataModel(title: title,status: status,date: date, isCompleted: false)
        data.append(newData)
    }
    
    func updateData(datas: DataModel) {
        if let index = data.firstIndex(where: { $0.id == datas.id }) {
            data[index] = datas.updateCompletion()
        }
    }
    
    func saveData() {
        if let encodedData = try? JSONEncoder().encode(data) {
            UserDefaults.standard.setValue(encodedData, forKey: dataKey)
        }
    }
}
