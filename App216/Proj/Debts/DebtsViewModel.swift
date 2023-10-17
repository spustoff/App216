//
//  DebtsViewModel.swift
//  App216
//
//  Created by Вячеслав on 10/17/23.
//

import SwiftUI

final class DebtsViewModel: ObservableObject {
    
    @AppStorage("debts") var debts: [Int] = []
    
    @Published var isAdd: Bool = false
    @Published var debt_field: String = "0"
}
