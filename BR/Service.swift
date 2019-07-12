//
//  Service.swift
//  BR
//
//  Created by Abraham Mangona on 2/21/19.
//  Copyright © 2019 Abraham Mangona. All rights reserved.
//

import Foundation

class Service{
    
    static let sharedInstance = Service()
    
    func getVideos(completion: @escaping((Video) -> ())){
        let urlString = URL(string: "https://5c6caff0d51de300146f5bf2.mockapi.io/videos")
        if let url = urlString {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error)
                } else {
                    if let usableData = data {
                        
                        if let jsonResponse = try? JSONSerialization.jsonObject(with:
                            usableData, options: []) as? [[String: Any]]{
                            for video in jsonResponse!{
                                
                                guard
                                    let id = video["id"] as? String,
                                    let title = video["title"] as? String,
                                    let author = video["author"] as? String,
                                    let thumbnail = video["thumbnail"] as? String,
                                    let duration = video["duration"] as? Int,
                                    let liked = video["liked"] as? String,
                                    let likedTime = video["liked_time"] as? Int,
                                    let plays = video["plays"] as? Int,
                                    let createdAt = video["createdAt"] as? Int
                                    else {
                                        return
                                }
                                
                                let newVideo = Video.init(id: id, title: title, author: author, thumbnail: thumbnail, duration: duration, liked: liked, likedTime: likedTime, plays: plays, createdAt: createdAt)
                                completion(newVideo)
                            }
                        }
                        
                    }
                }
            }
            task.resume()
        }
    }
    
}
