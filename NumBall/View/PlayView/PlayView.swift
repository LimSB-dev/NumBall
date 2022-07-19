//
//  PlayView.swift
//  NumBall
//
//  Created by 임성빈 on 2022/06/24.
//

import SwiftUI

struct PlayView: View {
    @StateObject var ntfModel: NumberTextFieldViewModel
    @State private var number: String = ""
    @State private var string: [String] = Array(repeating: "", count: 4)
    
    var body: some View {
        VStack {
            List {
                PlayListRow(strike: "1", ball: "2", number: "1234")
                PlayListRow(strike: "0", ball: "0", number: "5678")
                PlayListRow(strike: "2", ball: "2", number: "9132")
                PlayListRow(strike: "4", ball: "0", number: "2139")
                PlayListRow(strike: "1", ball: "2", number: "1234")
                PlayListRow(strike: "0", ball: "0", number: "5678")
                PlayListRow(strike: "2", ball: "2", number: "9132")
                PlayListRow(strike: "4", ball: "0", number: "2139")
            }
            .listStyle(.plain)
            .frame(maxHeight: UIScreen.main.bounds.height / 2)
            
//
//            GeometryReader { _ in
//                EmptyView()
//            }
//            .frame(height: 40)
        
            
            NumberField()
    
            Button(action: {
                
            }, label: {
                Text("Hit!")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical, 12)
                    .frame(width: 80)
                    .background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .foregroundColor(.green.opacity(0.5))
                    )
            })
            .padding(.top)

            KeyPad(string: $number)
                .frame(width: 300,height: 200)
                .padding(.vertical)
            
            GeometryReader { _ in
                EmptyView()
            }
            .frame(height: 40)
    
        } //END: VStack
    }
    
    //MARK: Custom Number Text Field
    @ViewBuilder
    func NumberField() -> some View {
        HStack(spacing: 15) {
            ForEach(0 ..< 4, id: \.self) { index in
                VStack(spacing: 10) {
                    TextField("", text: $number)
                        .font(.largeTitle)
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .multilineTextAlignment(.center)

                    Capsule()
                        .fill()
                        .frame(width: 30, height: 3, alignment: .center)
                }
                .frame(width: 40)
            }
        }
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
