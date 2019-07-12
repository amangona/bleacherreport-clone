//
//  FeedTableViewCell.swift
//  BR
//
//  Created by Abraham Mangona on 2/21/19.
//  Copyright © 2019 Abraham Mangona. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class FeedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var source: UILabel!
    
    @IBOutlet weak var fireBtn: UIButton!
    
    @IBOutlet weak var playerView: UIView!
    
    @IBOutlet weak var comments: UILabel!
    
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var detailView: UIView!
    
    @IBOutlet weak var commentField: UITextField!
    
    
    var avPlayer: AVPlayer!
    lazy var avPlayerController = AVPlayerViewController()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 0))
        
        userImage.layer.cornerRadius = 12.5
        commentField.layer.cornerRadius = 15.5
        commentField.layer.borderWidth = 0.3
        commentField.layer.borderColor = UIColor.lightGray.cgColor
        
        detailView.dropShadow()
  
        let url = NSURL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        
        avPlayer = AVPlayer(url: url as! URL)
        
        avPlayerController.player = avPlayer
        avPlayerController.view.frame = CGRect(x: 0, y: 0, width: playerView.frame.size.width, height: playerView.frame.size.height)
        playerView.addSubview(avPlayerController.view)
        
    }

    func injectDependencies(video: Video){
        title.text = video.title
        source.text = video.author
        userImage.setCustomImage(video.thumbnail)
        comments.text = "View all \(video.plays!) comments"
        fireBtn.setTitle("\(video.likedTime!)", for: .normal)
  
    }

}

extension UIView {
 
    func dropShadow() {
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 5
        
    }

}
