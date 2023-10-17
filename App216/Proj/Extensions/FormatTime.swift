//
//  FormatTime.swift
//  App216
//
//  Created by Вячеслав on 10/17/23.
//

import SwiftUI

func formatTime(time: Double) -> String {
    
    if time.isFinite {
        
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        
        return String(format: "%02d:%02d", minutes, seconds)
        
    } else {
        
        return "00:00"
    }
}

extension UIApplication {
    
    func endEditing() {
        
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
