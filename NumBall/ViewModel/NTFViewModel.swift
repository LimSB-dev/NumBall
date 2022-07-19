//
//  NTFViewModel.swift
//  NumBall
//
//  Created by 임성빈 on 2022/06/24.
//

import SwiftUI

class NTFViewModel: ObservableObject {
    @Published var numberText: String = ""
    @Published var numberTextFields: [String] = Array(repeating: "", count: 4)
}

