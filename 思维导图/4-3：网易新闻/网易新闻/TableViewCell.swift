//
//  TableViewCell.swift
//  网易新闻
//
//  Created by 吴鸿 on 2017/3/4.
//  Copyright © 2017年 吴鸿. All rights reserved.
//

import UIKit
import Kingfisher

class TableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    var newsModel : newsModel?{
        didSet{
            titleLabel.text = newsModel?.title
            let iconURL = URL(string: newsModel?.imgsrc ?? "")
            iconImageView.kf.setImage(with: iconURL)
        }
    }
}
