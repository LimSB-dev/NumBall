//
//  ContentView.swift
//  NumBall
//
//  Created by 임성빈 on 2022/06/23.
//

import SwiftUI

struct ContentView: View {
    @State private var ntfModel = NumberTextFieldViewModel()
    
    @State private var title: String = "NumBall"
    @State private var isSideMenuOpen: Bool = false
    @State private var isSettingOpen: Bool = false
    
    @State private var isPlayViewOpen: Bool = true
    @State private var isMemoViewOpen: Bool = false
    @State private var isLogViewOpen: Bool = false
    
    
    //MARK: Change Title
    func changeTitle() {
        if isSideMenuOpen {
            title = "Menu"
        } else if isSettingOpen {
            title = "Setting"
        } else {
            title = "NumBall"
        }
    }
    
    //MARK: CLOSE SIDE MENU
    func close() {
        isSideMenuOpen = false
        isSettingOpen = false
    }
    
 
    var body: some View {
        VStack {
            //MARK: HEADER
            HStack {
                //MARK: SIDE MENU
                Button(action: {
                    isSideMenuOpen.toggle()
                    changeTitle()
                }, label: {
                    Image(systemName: "line.3.horizontal")
                        .resizable()
                        .scaledToFit()
                })
                .frame(width: 25, height: 25)
                .scaledToFit()
                .opacity(isSettingOpen ? 0 : 1)
                .offset(x: isSettingOpen ? -20 : 0)
                
                if !isSideMenuOpen {
                    Spacer()
                }
                
                //MARK: TITLE
                Text(title.uppercased())
                    .foregroundColor(isSideMenuOpen || isSettingOpen ? .accentColor : .white)
                
                if !isSettingOpen {
                    Spacer()
                }
                
                //MARK: SETTING
                Button(action: {
                    isSettingOpen.toggle()
                    changeTitle()
                }, label: {
                    Image(systemName: "gear")
                        .resizable()
                        .scaledToFit()
                })
                .frame(width: 25, height: 25)
                .opacity(isSideMenuOpen ? 0 : 1)
                .offset(x: isSideMenuOpen ? 20 : 0)
                
                
            } //END: HStack
            .padding()
            .animation(.spring(), value: isSideMenuOpen || isSettingOpen)
               
            Spacer()
            
            ZStack(alignment: .bottom) {
                //MARK: CONTENT
                
                if isPlayViewOpen {
                    PlayView(ntfModel: ntfModel)
                        .opacity(isSideMenuOpen ? 0 : 1)
                        .opacity(isSettingOpen ? 0 : 1)
                } else if isMemoViewOpen {
                    
                } else if isMemoViewOpen {
                    
                }
                
                
                
                //MARK: FOOTER
                HStack {
                    Spacer()
                    
                    //MARK: PLAY View BUTTON
                    Button(action: {
                        isPlayViewOpen = true
                        isMemoViewOpen = false
                        isLogViewOpen = false
                    }, label: {
                        Image(systemName: "play")
                            .resizable()
                            .scaledToFit()
                    })
                    .offset(y: 10)
                    .frame(width: 25, height: 25, alignment: .center)
                    .foregroundColor(isPlayViewOpen ? .accentColor : .white)
                    
                    Spacer()
                        .frame(width: 80)
                    
                    //MARK: MEMO VIEW BUTTON
                    Button(action: {
                        isPlayViewOpen = false
                        isMemoViewOpen = true
                        isLogViewOpen = false
                    }, label: {
                        Image(systemName: "pencil.circle")
                            .resizable()
                            .scaledToFit()
                    })
                    .offset(y: 10)
                    .frame(width: 25, height: 25, alignment: .center)
                    .foregroundColor(isMemoViewOpen ? .accentColor : .white)
                    
                    Spacer()
                        .frame(width: 80)
                    
                    //MARK: LOG VIEW BUTTON
                    Button(action: {
                        isPlayViewOpen = false
                        isMemoViewOpen = false
                        isLogViewOpen = true
                    }, label: {
                        Image(systemName: "doc.plaintext")
                            .resizable()
                            .scaledToFit()
                    })
                    .offset(y: 10)
                    .frame(width: 25, height: 25, alignment: .center)
                    .foregroundColor(isLogViewOpen ? .accentColor : .white)
                    
                    Spacer()
                    
                } //END: HStack
                .padding(30)
                .opacity(isSideMenuOpen ? 0 : 1)
                .opacity(isSettingOpen ? 0 : 1)
                .animation(.spring(), value: isSideMenuOpen || isSettingOpen || isPlayViewOpen || isMemoViewOpen || isLogViewOpen)
                
                //MARK: SIDE MENU VIEW
                SideMenuView(width: 300, isSideMenuOpen: isSideMenuOpen, closeSideMenu: close)
                
                //MARK: SETTING VIEW
                SettingView(width: 300, isSettingOpen: isSettingOpen, closeSetting: close)
            } //END: VStack
            
        } //END: ZStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
