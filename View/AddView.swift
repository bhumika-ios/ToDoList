//
//  AddView.swift
//  ToDoList
//
//  Created by Bhumika Patel on 22/11/22.
//

import SwiftUI

struct AddView: View {
    //MARK: - Variables
    @EnvironmentObject private var dataViewModel: DataViewModel
    @Environment (\.dismiss) private var dismiss
    @State private var textFieldText: String = ""
    @State private var text1FieldText: String = ""
    @State private var alertTitle: String = ""
    @State private var selectedDate = Date()
    let notify = NotificationHandler()
   
    @State private var showAlert: Bool = false
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(uiColor: .systemGray5))
                    .cornerRadius(10)
                TextField("Type something here...", text: $text1FieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(uiColor: .systemGray5))
                    .cornerRadius(10)
                
                    DatePicker("Pick a Date", selection: $selectedDate, in: Date()...)
                        //.datePickerStyle(GraphicalDatePickerStyle())
                
                Button {
//                    notify.sendNotification(date: Date(), type: "time",timeInterval: 5, title: "hi..", body: "5 sec. notification message")
                    notify.sendNotification(date: selectedDate, type: "date", title: textFieldText, body: text1FieldText)
                    
                    notify.askNotification()
                    
                    self.saveButtonPressed()
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
        .navigationTitle("Add Data 🖋")
        
        .alert(isPresented: $showAlert, content: getAlert)
    }
    private func saveButtonPressed() {
        if isTextAppropriate() {
            dataViewModel.addData(title: textFieldText, status: text1FieldText, date: selectedDate)
            dismiss.callAsFunction()
        }
    }
    private func isTextAppropriate() -> Bool {
        if textFieldText.count < 3 && text1FieldText.count < 3{
            alertTitle = "Your new todo data must be at least 3 characters long!! 😨😰"
            showAlert.toggle()
            return false
        }
        return true
    }
    private func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
        .environmentObject(DataViewModel())
    }
}
