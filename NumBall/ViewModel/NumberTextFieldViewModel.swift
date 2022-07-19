//
//  NumberTextFieldViewModel.swift
//  NumBall
//
//  Created by 임성빈 on 2022/06/25.
//

import SwiftUI

class NumberTextFieldViewModel: ObservableObject {
    @Published var ntfText: String = ""
    @Published var ntfFields: [String] = Array(repeating: "", count: 4)
}

