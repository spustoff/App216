//
//  MainView.swift
//  App216
//
//  Created by Вячеслав on 10/17/23.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack(alignment: .leading, spacing: 50, content: {
                    
                    HStack(content: {
                        
                        VStack(alignment: .leading, spacing: 5, content: {
                            
                            Text("Bank's name")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .regular))
                            
                            Text("$\(35)")
                                .foregroundColor(.white)
                                .font(.system(size: 23, weight: .bold))
                        })
                        
                        Spacer()
                    })
                    
                    HStack {
                        
                        Text("0000 0000 0000 0000")
                            .foregroundColor(.white.opacity(0.5))
                            .font(.system(size: 13, weight: .regular))
                        
                        Spacer()
                        
                        Text("125")
                            .foregroundColor(.white.opacity(0.7))
                            .font(.system(size: 13, weight: .regular))
                    }
                })
                .padding()
                .background(LinearGradient(colors: [Color("blue"), Color.purple], startPoint: .leading, endPoint: .trailing)
                    .cornerRadius(15))
                .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        HStack {
                            
                            VStack(alignment: .center, spacing: 4, content: {
                                
                                Text("Bank users")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                
                                Text("2 592 853")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                            
                            Spacer()
                            
                            VStack(alignment: .center, spacing: 4, content: {
                                
                                Text("Currencies")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                
                                Text("\(viewModel.currencies.count)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                        }
                        .padding(.horizontal)
                        
                        Text("My Currencies")
                            .foregroundColor(.white)
                            .font(.system(size: 21, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding([.horizontal, .top])
                        
                        ForEach(viewModel.currencies, id: \.self) { index in
                        
                            Button(action: {
                                
                                viewModel.selected_currency = index
                                viewModel.isDetail = true
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Image("btc")
                                    
                                    Text(index)
                                        .foregroundColor(.white)
                                        .font(.system(size: 15, weight: .medium))
                                    
                                    Spacer()
                                    
                                    Text("+\(Int.random(in: 1...25))%")
                                        .foregroundColor(.green)
                                        .font(.system(size: 12, weight: .regular))
                                        .padding(8)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                                    
                                    Text("$\(Int.random(in: 1...25555))")
                                        .foregroundColor(.white)
                                        .font(.system(size: 17, weight: .medium))
                                }
                                .padding(10)
                                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                                .padding(.horizontal)
                            })
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            MainDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    MainView()
}
