//
//  StatisticsView.swift
//  App216
//
//  Created by Вячеслав on 10/17/23.
//

import SwiftUI

struct StatisticsView: View {
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Statistics")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Image("stats")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 5, content: {
                    
                    Text("Amount of currencies purchased")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                    
                    Text("$0")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                    
                })
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.2)))
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 5, content: {
                    
                    Text("Amount earned")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                    
                    Text("$0")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                    
                })
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.2)))
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

#Preview {
    StatisticsView()
}
