//
//  VideoCell.swift
//  Refresh
//
//  Created by Macbook Pro 13 on 01/11/2021.
//

import UIKit

class VideoCell: UITableViewCell {
    
    var videoImage = UIImageView()
    var videoTitle = UILabel()
    var viewSub = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(viewSub)
        configViewSub()
        configImage()
        configTitle()
        configTileLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setVideo(video : Video) {
        if let url = URL(string: video.image ?? "") {
            videoImage.load(url: url)
            videoTitle.text = video.title
        }
    }
    
    fileprivate func configViewSub(){
        viewSub.translatesAutoresizingMaskIntoConstraints = false
        viewSub.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 12).isActive = true
        viewSub.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -12).isActive = true
        viewSub.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 12).isActive = true
        viewSub.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -12).isActive = true
        viewSub.alignment = .center
        viewSub.axis = .horizontal
        viewSub.distribution = .fill
        viewSub.spacing = 10
        viewSub.addArrangedSubview(videoImage)
        viewSub.addArrangedSubview(videoTitle)
    }
    
    fileprivate func configTileLabel() {
        videoTitle.numberOfLines = 0
        videoTitle.adjustsFontSizeToFitWidth = true
    }
    
    
    fileprivate func configImage() {
        videoImage.translatesAutoresizingMaskIntoConstraints  = false
        [
            videoImage.heightAnchor.constraint(equalToConstant: 80),
            videoImage.widthAnchor.constraint(equalTo: videoImage.heightAnchor,multiplier: 16/9),
        ].forEach{ $0.isActive = true }
    }
    
    fileprivate func configTitle() {
        videoTitle.translatesAutoresizingMaskIntoConstraints = false
     }
}
