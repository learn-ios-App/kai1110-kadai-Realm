//
//  AddFruitView.swift
//  kai1110-kadai-Realm
//
//  Created by 渡邊魁優 on 2023/05/08.
//

import SwiftUI

struct AddFruitView: View {
    @State var text = ""
    let save: (String) -> Void
    let cancel: () -> Void
    var body: some View {
        VStack {
            TextField("", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 150)
                .padding()
            
            HStack {
                Spacer()
                Button(action: {
                    cancel()
                }) {
                    Text("Cancel")
                }
                Spacer()
                Button(action: {
                    save(text)
                }) {
                    Text("Save")
                }
                Spacer()
            }
        }
    }
}

struct AddFruitView_Previews: PreviewProvider {
    static var previews: some View {
        AddFruitView(save: { _ in }, cancel: {})
    }
}
