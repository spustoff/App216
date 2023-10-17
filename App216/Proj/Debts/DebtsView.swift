//
//  DebtsView.swift
//  App216
//
//  Created by Вячеслав on 10/17/23.
//

import SwiftUI

struct DebtsView: View {
    
    @StateObject var viewModel = DebtsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("My Debts")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(alignment: .leading) {
                        
                        VStack(alignment: .leading, spacing: 20, content: {
                            
                            Text("Amount of debts")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                            
                            Text("$\(viewModel.debts.reduce(0, +))")
                                .foregroundColor(.white)
                                .font(.system(size: 25, weight: .semibold))
                            
                            Rectangle()
                                .fill(.gray.opacity(0.2))
                                .frame(height: 2)
                            
                            HStack {
                                
                                Text("Amount of credits")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Spacer()
                                
                                Text("\(viewModel.debts.count)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .regular))
                            }
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.2)))
                        
                        Button(action: {
                            
                            viewModel.isAdd = true
                            
                        }, label: {
                            
                            Text("Take out a new loan")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("blue")))
                                .padding([.top, .bottom])
                        })
                        
                        if viewModel.debts.isEmpty {
                            
                            VStack(alignment: .center, spacing: 10, content: {
                                
                                Image("empty")
                                
                                Text("You have no debts")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .semibold))
                                    .multilineTextAlignment(.center)
                                
                                Text("You don't have any debts yet. If you need money for development, you can apply for a loan at any time")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .multilineTextAlignment(.center)
                            })
                            .padding()
                            .padding(.top, 40)
                            
                        } else {
                            
                            ForEach(viewModel.debts, id: \.self) { index in
                                
                                HStack {
                                    
                                    VStack(alignment: .leading, spacing: 6, content: {
                                        
                                        Text("$\(index)")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .medium))
                                        
                                        Text("48 months")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 13, weight: .regular))
                                    })
                                    
                                    Spacer()
                                    
                                    Circle()
                                        .fill(.gray.opacity(0.2))
                                        .frame(width: 15, height: 15)
                                }
                            }
                        }
                    }
                    .padding([.horizontal, .bottom])
                }
            }
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            DebtsAdd(viewModel: viewModel)
        })
    }
}

#Preview {
    DebtsView()
}
