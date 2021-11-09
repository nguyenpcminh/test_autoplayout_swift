//
//  ViewController.swift
//  Refresh
//
//  Created by Macbook Pro 13 on 29/10/2021.
//

import UIKit

class ViewController: UIViewController {

    let tableView = UITableView()
    var listVideo : [Video] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Con chim xanh xanh"
        configTableView()
        fetchData()
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "1")
    }
    
    struct Cells {
        static let videoCell : String = "VideoCell"
    }
    
    fileprivate func configTableView() {
        view.addSubview(tableView)
        setTableViewDelegate()
        tableView.rowHeight = 100
        tableView.pin(to: view)
        tableView.showsVerticalScrollIndicator = false
        tableView.register(VideoCell.self, forCellReuseIdentifier: Cells.videoCell)
    }

    fileprivate func setTableViewDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func fetchData() {
        for i in 0..<100 {
            listVideo.append(Video(image: "https://picsum.photos/200/\(i)00", title: "Alibaba"))
        }
    }
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.videoCell) as! VideoCell
        let video = listVideo[indexPath.row]
        cell.setVideo(video: video)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listVideo.count
    }
    
}

