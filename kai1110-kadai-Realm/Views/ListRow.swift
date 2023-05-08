//
//  ListRow.swift
//  kai1110-kadai-Realm
//
//  Created by 渡邊魁優 on 2023/05/07.
//

import SwiftUI

struct ListRow: View {
    @EnvironmentObject var fruitViewModel: FruitsData
    let index: Int
    var body: some View {
        HStack {
            Button(action: {
                fruitViewModel.didTapCheckMark(index: index)
            }) {
                Image(
                    systemName: fruitViewModel.fruitsList[index].isCheck
                    ? "checkmark.circle"
                    : "circle"
                )
            }
            Text(fruitViewModel.fruitsList[index].name)
            Spacer()
            Button(action: {
                fruitViewModel.didTapIButton()
            }) {
                Image(systemName: "i.circle")
                    .foregroundColor(.blue)
            }
            .buttonStyle(BorderlessButtonStyle())
        }
        .sheet(isPresented: $fruitViewModel.isEditView) {
            EditView(text: fruitViewModel.fruitsList[index].name,
                     save: { text in fruitViewModel.didTapEditViewSaveButton(text: text, index: index) },
                     cancel: { fruitViewModel.didTapEditViewCancelButton() })
        }
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(FruitsData())
    }
}
