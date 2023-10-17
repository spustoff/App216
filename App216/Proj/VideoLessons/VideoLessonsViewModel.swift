//
//  VideoLessonsViewModel.swift
//  App216
//
//  Created by Вячеслав on 10/17/23.
//

import SwiftUI
import Alamofire

final class VideoLessonsViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    
    @AppStorage("viewed_videos") var viewed_videos: Int = 0
    @AppStorage("favorited") var favorited: [String] = []
    
    @Published var lessons: [VideoItem] = []
    
    @Published var selectedLesson: VideoItem = VideoItem(id: 1, categoryId: 1, title: "", image: "", video: "", duration: 1)
    @Published var isDetail: Bool = false
    
    func getVideos() {
        
        isLoading = true
        
        self.fetchVideos() { result in
            
            switch result {
                
            case .success(let success):
                
                self.lessons = success.rows
                
            case .failure(let failure):
                
                debugPrint("Parse error - \(failure)")
                
                self.isLoading = false
            }
        }
    }
    
    func fetchVideos(completion: @escaping (Result<VideoModel, Error>) -> Void ) {
        
        isLoading = true
        
        let params: Parameters = [
            
            "token": "2e930694-1734-48dd-bf9f-f36f562aedff",
        ]
        
        let request = AF.request("https://cleontiss.space/api/v2/video", method: .get, parameters: params)
        
        request.responseDecodable(of: VideoModel.self) { response in
            
            guard let value = response.value else {
                
                self.isLoading = false
                return
            }
                           
            switch response.result{
                
            case .success(_):
                
                completion(.success(value))
                self.isLoading = false
                
            case .failure(_):
                
                completion(.failure(response.error.debugDescription as! Error))
                self.isLoading = false
            }
        }
    }
}
