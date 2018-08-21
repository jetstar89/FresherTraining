//
//  PostTableViewCell.swift
//  TimeKeeping
//
//  Created by Đinh Ngọc Vũ on 8/21/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let subView = UIView(frame: CGRect(x: 0, y: frame.height - 2, width: UIScreen.main.bounds.size.width, height: 2))
        subView.backgroundColor = UIColor.paleGrey
        addSubview(subView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
