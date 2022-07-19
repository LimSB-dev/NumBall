//
//  SideMenuView.swift
//  NumBall
//
//  Created by 임성빈 on 2022/06/23.
//

import SwiftUI

struct SideMenuView: View {
    let width: CGFloat
    var isSideMenuOpen: Bool
    let closeSideMenu: () -> Void
    
    var body: some View {
        ZStack {
            //MARK: BACKGROUND
            GeometryReader { _ in
                EmptyView()
            } //END: GeometryReader
            .background(.white.opacity(0.2))
            .opacity(isSideMenuOpen ? 1 : 0)
            .onTapGesture {
                closeSideMenu()
            }

            
            //MARK: SIDE MENU VIEW
            HStack {
                VStack {
                    Image(systemName: "info.circle")
                        .frame(width: 100, height: 100, alignment: .center)
                    
                    HStack(alignment: .center) {
                        Text("About App")
                            .foregroundColor(.accentColor)
                            .padding(5)
                        
                        Spacer()
                    } //END: HStack
                    .background(.ultraThinMaterial)
                    
                    List {
                        
                        SideMenuRowView(icon: "envelope", title: "문의", name: "")
                        
                        SideMenuRowView(icon: "star", title: "평가", name: "")
                        
                        SideMenuRowView(icon: "info.circle", title: "버전", name: "1.0")
                        
                        SideMenuRowView(icon: "person", title: "개발자", name: "임성빈")
                    }
                    .listStyle(.plain)
                    
                    Spacer()
                    
                } //END: VStack
                .frame(width: width)
                .background(.black)
                .offset(x: isSideMenuOpen ? 0 : -width)
                
                Spacer()
            } //END: HStack
            
        } //END: ZStack
        .animation(.easeIn, value: isSideMenuOpen)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
