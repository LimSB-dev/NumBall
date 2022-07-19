//
//  Setting.swift
//  NumBall
//
//  Created by 임성빈 on 2022/06/23.
//

import Foundation

struct Setting {
    var userName: String
    var prefersNotifications = true
    var preferredColorScheme = Scheme.light
    var perferredNumber: Int
    
    static let `default` = Setting(userName: "User Name", perferredNumber: 1234)
    
    enum Scheme: String, CaseIterable, Identifiable {
        case light = "sun.max.fill"
        case dark = "moon.fill"
        
        var id: String { rawValue }
    }
}
