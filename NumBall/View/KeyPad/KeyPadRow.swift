//
//  KeyPadRow.swift
//  NumBall
//
//  Created by 임성빈 on 2022/06/25.
//

import SwiftUI

struct KeyPadRow: View {
    var keys: [String]

        var body: some View {
            HStack {
                ForEach(keys, id: \.self) { key in
                    KeyPadButton(key: key)
                }
            }
        }
    }

struct KeyPadRow_Previews: PreviewProvider {
    static var previews: some View {
        KeyPadRow(keys: ["7", "8", "9"])
            .previewLayout(.sizeThatFits)
    }
}
