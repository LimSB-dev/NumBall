//
//  PlayListRow.swift
//  NumBall
//
//  Created by 임성빈 on 2022/06/25.
//

import SwiftUI

struct PlayListRow: View {
    let strike: String
    let ball: String
    let number: String
    
    var body: some View {
        HStack {
            Image("BaseBall")
                    .resizable()
                    .scaledToFit()
            
            HStack {
                Text(strike)
                
                Spacer()
                
                Text("S")
                    .foregroundColor(Color.red.opacity(0.75))
                
                Spacer()
                
                Text(ball)
                
                Spacer()
                
                Text("B")
                    .foregroundColor(Color.blue.opacity(0.75))
            }
            .frame(width: 70)
            
            Spacer()
            
            Text(number)
                .font(.headline)
                .tracking(10)
        }
        .padding(.horizontal, 30)
        .frame(height: 20)
    }
}

struct PlayListRow_Previews: PreviewProvider {
    static var previews: some View {
        PlayListRow(strike: "1", ball: "2", number: "1234")
    }
}
