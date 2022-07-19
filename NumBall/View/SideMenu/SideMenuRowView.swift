//
//  SideMenuRowView.swift
//  NumBall
//
//  Created by 임성빈 on 2022/06/23.
//

import SwiftUI

struct SideMenuRowView: View {
    let icon: String
    let title: String
    let name: String?
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.accentColor)
            
            Text(title)
            
            Spacer()
            
            Text(name!)
        }
        .padding()
    }
}

struct SideMenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuRowView(icon: "info.circle", title: "버전", name: "1.0")
            .previewLayout(.sizeThatFits)
    }
}
