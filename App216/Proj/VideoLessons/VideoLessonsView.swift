//
//  VideoLessonsView.swift
//  App216
//
//  Created by Вячеслав on 10/17/23.
//

import SwiftUI

struct VideoLessonsView: View {
    
    @StateObject var viewModel = VideoLessonsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Video Lesson")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                if viewModel.isLoading {
                    
                    ProgressView()
                        .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    if viewModel.lessons.isEmpty {
                        
                        VStack(alignment: .center, spacing: 7, content: {
                            
                            Image("empty")
                            
                            Text("Empty")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                                .multilineTextAlignment(.center)
                            
                            Text("You don't have any properties added yet")
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .regular))
                                .multilineTextAlignment(.center)
                        })
                        .frame(maxHeight: .infinity, alignment: .center)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: true) {
                            
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                                
                                ForEach(viewModel.lessons, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.selectedLesson = index
                                        viewModel.isDetail = true
                                        
                                    }, label: {
                                        
                                        VStack(alignment: .leading, spacing: 8, content: {
                                            
                                            WebPic(urlString: index.image ?? "", width: .infinity, height: 100, cornerRadius: 15, isPlaceholder: true)
                                            
                                            Text(index.title ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 14, weight: .medium))
                                                .multilineTextAlignment(.leading)
                                                .lineLimit(2)
                                        })
                                    })
                                }
                            }
                            .padding([.horizontal, .bottom])
                        }
                    }
                }
            }
        }
        .onAppear {
            
            viewModel.getVideos()
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            VideoDetail(index: viewModel.selectedLesson)
        })
    }
}

#Preview {
    VideoLessonsView()
}
