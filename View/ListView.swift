//
//  ListView.swift
//  ToDoList
//
//  Created by Bhumika Patel on 22/11/22.
//

import SwiftUI

struct ListView: View {
    //MARK: - Variables
    @EnvironmentObject var dataViewModel: DataViewModel
    var body: some View {
        ZStack {
            if dataViewModel.data.isEmpty {
                HomeScreen()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(dataViewModel.data) { data2 in
                        ListRowView(data: data2)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    dataViewModel.updateData(datas: data2)
                                }
                            }
                    }
                    .onDelete(perform: dataViewModel.removeData(at:))
                    .onMove(perform: dataViewModel.moveData(from:to:))
                }
                .listStyle(.plain)
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
