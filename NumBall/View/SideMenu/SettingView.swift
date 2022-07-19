//
//  SettingView.swift
//  NumBall
//
//  Created by 임성빈 on 2022/06/23.
//

import SwiftUI

struct SettingView: View {
    
    @State private var selectedScheme = 0
    var schemes = ["sun.max.fill" , "moon.fill"]
    
    let width: CGFloat
    let isSettingOpen: Bool
    let isDarkMode: Bool = false
    let closeSetting: () -> Void
    
    var body: some View {
        ZStack {
            //MARK: BACKGROUND
            GeometryReader { _ in
                EmptyView()
            } //END: GeometryReader
            .background(.white.opacity(0.2))
            .opacity(isSettingOpen ? 1 : 0)
            .onTapGesture {
                closeSetting()
            }
            
            
            //MARK: SETTING VIEW
            HStack {
                
                Spacer()
                
                VStack {
                                      
                    List {
                        //MARK: COLOR SCHEME
                        HStack {
                            Picker("Color Scheme", selection: $selectedScheme) {
                                ForEach(0 ..< schemes.count, id: \.self) { index in
                                    Image(systemName: schemes[index])
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                        
                    }
                    .listStyle(.sidebar)
                    
                } //END: VStack
                .frame(width: width)
                .background(.black)
                .offset(x: isSettingOpen ? 0 : width)
            } //END: HStack
    } //END: ZStack
    .animation(.easeIn, value: isSettingOpen)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
