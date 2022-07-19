//
//  KeyPadButton.swift
//  NumBall
//
//  Created by 임성빈 on 2022/06/25.
//

import SwiftUI

struct KeyPadButton: View {
    var key: String
    
    var body: some View {
        Button(action: { action(key) }) {
            Color.clear
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.green.opacity(0.75))
                )
                .overlay(
                    Text(key)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                )
        }
    }
    
    enum ActionKey: EnvironmentKey {
        static var defaultValue: (String) -> Void { { _ in } }
    }
    
    @Environment(\.keyPadButtonAction) var action: (String) -> Void
}

extension EnvironmentValues {
    var keyPadButtonAction: (String) -> Void {
        get { self[KeyPadButton.ActionKey.self] }
        set { self[KeyPadButton.ActionKey.self] = newValue }
    }
}

struct KeyPadButton_Previews: PreviewProvider {
    static var previews: some View {
        KeyPadButton(key: "8")
            .padding()
            .frame(width: 80, height: 80)
            .previewLayout(.sizeThatFits)
    }
}
