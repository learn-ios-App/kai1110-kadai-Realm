//
//  ContentView.swift
//  kai1110-kadai-Realm
//
//  Created by 渡邊魁優 on 2023/05/07.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var fruitViewModel: FruitsData
    var body: some View {
        NavigationStack {
            List {
                ForEach(fruitViewModel.fruitsList.indices, id: \.self) { index in
                    ListRow(index: index)
                }
            }
            .listStyle(InsetListStyle())
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        fruitViewModel.didTapPlusButton()
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $fruitViewModel.isAddView) {
            AddFruitView(save:  { text in
                fruitViewModel.didTapAddViewSaveButton(text: text)
            }, cancel: {
                fruitViewModel.didTapAddViewCancelButton()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(FruitsData())
    }
}
