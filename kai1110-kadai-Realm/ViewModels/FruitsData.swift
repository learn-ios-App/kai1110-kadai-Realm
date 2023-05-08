//
//  FruitsData.swift
//  kai1110-kadai-Realm
//
//  Created by 渡邊魁優 on 2023/05/07.
//

import Foundation

class FruitsData: ObservableObject {
    @Published var fruitsList: [Fruit] = [Fruit(name: "りんご", isCheck: false)]
    @Published var isAddView = false
    @Published var isEditView = false
    
    
    func didTapCheckMark(index: Int) {
        self.fruitsList[index].isCheck.toggle()
    }

    //FruitAddView関連のメソッド
    func didTapPlusButton() {
        isAddView = true
    }
    func didTapAddViewCancelButton() {
        isAddView = false
    }
    func didTapAddViewSaveButton(text: String) {
        fruitsList.append(Fruit(name: text, isCheck: false))
        isAddView = false
    }
    
    //EditView関連のメソッド
    func didTapIButton() {
        isEditView = true
    }
    func didTapEditViewCancelButton() {
        isEditView = false
    }
    func didTapEditViewSaveButton(text: String, index: Int) {
        fruitsList[index].name = text
        isEditView = false
    }
}
