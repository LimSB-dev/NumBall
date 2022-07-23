//
//  PlayView.swift
//  NumBall
//
//  Created by 임성빈 on 2022/06/24.
//

import SwiftUI

struct PlayView: View {
    @StateObject var ntfModel: NumberTextFieldViewModel
    //MARK: TextField FocusState
    @FocusState var activeField: NTFField!
    @State private var currentIndex: Int = 0
    
    
    
    var body: some View {
        VStack {
            List {
                PlayListRow(strike: "1", ball: "2", number: "1234")
                PlayListRow(strike: "0", ball: "0", number: "5678")
                PlayListRow(strike: "2", ball: "2", number: "9132")
                PlayListRow(strike: "3", ball: "0", number: "4139")
                PlayListRow(strike: "1", ball: "2", number: "1234")
                PlayListRow(strike: "0", ball: "0", number: "5678")
                PlayListRow(strike: "2", ball: "2", number: "9132")
                PlayListRow(strike: "4", ball: "0", number: "2139")
            }
            .listStyle(.plain)
            .frame(maxHeight: UIScreen.main.bounds.height / 2)
            .padding(.vertical)
            
//
//            GeometryReader { _ in
//                EmptyView()
//            }
//            .frame(height: 40)
        
            
            NumberField()
    
            Button(action: {
        
            }, label: {
                Text("Hit! \(currentIndex)")
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

            KeyPad(string: $ntfModel.ntfFields[currentIndex])
                .frame(width: 300,height: UIScreen.main.bounds.height / 3.5)
                .padding(.vertical)
                
  
            
            
            GeometryReader { _ in
                EmptyView()
            }
            .frame(height: UIScreen.main.bounds.height / 15)
    
        } //END: VStack
        .onChange(of: ntfModel.ntfFields) { newValue in
            NTFCondition(value: newValue)
        }
    }
    
    //MARK: Conditions For Custom NTF Field & Limiting Only one Text
    func NTFCondition(value: [String]) {
        //MARK: If Current Field Typed

        //MARK: Moving next Field if Current Field Typed
        for index in 0..<3 {
            if value[index].count == 1 && activeStateForIndex(index: index) == activeField {
                activeField = activeStateForIndex(index: index + 1)
                
//                if currentIndex < 3 {
//                    currentIndex += 1
//                }
            }
        }
        

        
        //MARK: Delete previous Field if Current Field Deleted
        for index in 1...3 {
            if value[index].isEmpty && !value[index - 1].isEmpty {
                activeField = activeStateForIndex(index: index - 1)
//                if currentIndex > 0 {
//                    currentIndex -= 1
//                }
            }
        }

         
        for index in 0..<4 {
            if value[index].count > 1 {
                ntfModel.ntfFields[index] = String(value[index].last!)
            }
        }
    }
    
    //MARK: Custom Number Text Field
    @ViewBuilder
    func NumberField() -> some View {
        HStack(spacing: 15) {
            ForEach(0 ..< 4, id: \.self) { index in
                VStack(spacing: 10) {
                    TextField("", text: $ntfModel.ntfFields[index])
                        .font(.largeTitle)
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .multilineTextAlignment(.center)
                        .focused($activeField, equals: activeStateForIndex(index: index))

                    Capsule()
                        .fill(activeField == activeStateForIndex(index: index) ? .green : .gray.opacity(0.3))
                        .frame(width: 30, height: 3, alignment: .center)
                }
                .frame(width: 40)
            }
        }
    }
    
    func activeStateForIndex(index: Int) -> NTFField {
        switch index {
        case 0: return .field1
        case 1: return .field2
        case 2: return .field3
        default: return .field4
        }
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//MARK: FocusState Enum
enum NTFField{
    case field1
    case field2
    case field3
    case field4
}
