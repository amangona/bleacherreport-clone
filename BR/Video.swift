//
//  Video.swift
//  BR
//
//  Created by Abraham Mangona on 2/21/19.
//  Copyright © 2019 Abraham Mangona. All rights reserved.
//

import Foundation
import UIKit

struct Video{
    
    var id: String!
    var title: String!
    var author: String!
    var thumbnail: String!
    var duration: Int!
    var liked: String!
    var likedTime: Int!
    var plays: Int!
    var createdAt: Int!
    
}

extension UIImageView {
    
    func setCustomImage(_ imgURLString: String?) {
        guard let imageURLString = imgURLString else {
            self.image = UIImage(named: "default.png")
            return
        }
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: URL(string: imageURLString)!)
            DispatchQueue.main.async {
                self.image = data != nil ? UIImage(data: data!) : UIImage(named: "default.png")
            }
        }
    }
}
