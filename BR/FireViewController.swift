//
//  ViewController.swift
//  BR
//
//  Created by Abraham Mangona on 2/21/19.
//  Copyright © 2019 Abraham Mangona. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class FireViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let service = Service.sharedInstance
    
    var videos = [Video](){
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        service.getVideos(completion: { video in
            DispatchQueue.main.async {
                self.videos.append(video)
            }
        })
        
        
    }

}

extension FireViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else{ return UITableViewCell() }
        cell.injectDependencies(video: videos[indexPath.row])
        return cell
    }
    
}
