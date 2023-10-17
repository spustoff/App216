//
//  DebtsAdd.swift
//  App216
//
//  Created by Вячеслав on 10/17/23.
//

import SwiftUI

struct DebtsAdd: View {
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel: DebtsViewModel
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("New Loan")
                        .foregroundColor(.white)
                        .font(.system(size: 19, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .bold))
                            .padding(7)
                            .background(Circle().fill(.gray.opacity(0.2)))
                    })
                }
                .padding()
                .padding(.top)
                
                VStack(alignment: .leading, content: {
                    
                    HStack {
                        
                        Text("$\(viewModel.debt_field)")
                            .foregroundColor(.white)
                            .font(.system(size: 23, weight: .semibold))
                            .lineLimit(1)
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewModel.debts.append(Int(viewModel.debt_field) ?? 0)
                            
                            router.wrappedValue.dismiss()
                            
                            viewModel.debt_field = "0"
                            
                        }, label: {
                            
                            Text("Get money")
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .regular))
                                .padding(8)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("blue")))
                                .opacity(viewModel.debt_field.first != "0" ? 1 : 0.5)
                        })
                        .disabled(viewModel.debt_field.first != "0" ? false : true)
                    }
                })
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.2)))
                .padding(.horizontal)
                
                Spacer()
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], content: {
                    
                    ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0], id: \.self) { index in
                        
                        Button(action: {
                            
                            if viewModel.debt_field.first == "0" {
                                
                                viewModel.debt_field.removeFirst()
                            }
                            
                            viewModel.debt_field.append("\(index)")
                            
                        }, label: {
                            
                            Text("\(index)")
                                .foregroundColor(.white)
                                .font(.system(size: 25, weight: .bold))
                                .frame(width: 99, height: 99)
                        })
                    }
                    
                    Button(action: {
                        
                        viewModel.debt_field = "0"
                        
                    }, label: {
                        
                        Image("delete")
                    })
                })
            }
        }
    }
}

#Preview {
    DebtsAdd(viewModel: DebtsViewModel())
}
