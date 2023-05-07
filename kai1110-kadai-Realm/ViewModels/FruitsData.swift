//
//  FruitsData.swift
//  kai1110-kadai-Realm
//
//  Created by 渡邊魁優 on 2023/05/07.
//

import Foundation

class FruitsData: ObservableObject {
    @Published var fruitsList: [Fruit] = [Fruit(name: "りんご", isCheck: false)]
    
    func didTapCheckMark(index: Int) {
        self.fruitsList[index].isCheck.toggle()
    }
    
    func addFruits() {
        self.fruitsList.append(Fruit(name: "aaa", isCheck: false))
    }
}
