//
//  MainViewModel.swift
//  App216
//
//  Created by Вячеслав on 10/17/23.
//

import SwiftUI

final class MainViewModel: ObservableObject {
    
    @Published var currencies: [String] = ["EURUSD", "EURTRY", "EURKZT", "EURCAD", "EURJPY"]
    
    @Published var selected_currency: String = "EURUSD"
    @Published var isDetail: Bool = false
}
