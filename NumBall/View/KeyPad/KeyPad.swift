//
//  KeyPad.swift
//  NumBall
//
//  Created by 임성빈 on 2022/06/25.
//

import SwiftUI

struct KeyPad: View {
    @Binding var string: String
    
    var body: some View {
        VStack {
            KeyPadRow(keys: ["1", "2", "3"])
            KeyPadRow(keys: ["4", "5", "6"])
            KeyPadRow(keys: ["7", "8", "9"])
            KeyPadRow(keys: [".", "0", "⌫"])
        }.environment(\.keyPadButtonAction, self.keyWasPressed(_:))
    }
    
    private func keyWasPressed(_ key: String) {
        switch key {
        case "." where string.contains("."): break
        case "." where string == "0": string += key
        case "⌫":
            string.removeLast()
            if string == "0" { string = "" }
        case _ where string == "0": string = key
        default: string += key
        }
    }
}


