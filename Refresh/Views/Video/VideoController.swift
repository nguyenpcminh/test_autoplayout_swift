//
//  VideoViewController.swift
//  Refresh
//
//  Created by Macbook Pro 13 on 03/11/2021.
//

import UIKit

class VideoController : UIViewController {
    
    let tbv = UITableView()
    var listVideo : [Video] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configDelegateTbv()
        configTbv()
        fetchData()
    }
    
    struct Cells {
        static var videoCell = "VideoCell"
    }
    
    fileprivate func configTbv() {
        view.addSubview(tbv)
        tbv.rowHeight = UITableView.automaticDimension
        tbv.estimatedRowHeight = 600
        tbv.translatesAutoresizingMaskIntoConstraints = false
        [tbv.topAnchor.constraint(equalTo: view.topAnchor),
         tbv.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         tbv.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         tbv.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ].forEach { $0.isActive = true }
        tbv.register(VideoCell.self, forCellReuseIdentifier: Cells.videoCell)
    }
    
    fileprivate func configDelegateTbv() {
        tbv.delegate = self
        tbv.dataSource = self
    }
    
    func fetchData() {
        for i in 0..<100 {
            listVideo.append(Video(image: "https://picsum.photos/200/\(i)00", title: "Alibaba  asdadasd adas dad asd asd \n alibaba \n alibaba \(i) \n alibab \n aliba \n aliaba \n 213 \n 123"))
        }
    }
    
}

extension VideoController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbv.dequeueReusableCell(withIdentifier: Cells.videoCell) as! VideoCell
        let video = listVideo[indexPath.row]
        cell.setVideo(video: video)
        return cell
    }
    
    
}
