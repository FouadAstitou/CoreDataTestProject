//
//  CustomNewsItemCell.swift
//  OrbitNews
//
//  Created by Supervisor on 18-09-16.
//  Copyright © 2016 Nerdvana. All rights reserved.
//

import UIKit

class CustomNewsItemCell: UITableViewCell {

    var titleLabel = UILabel()
    var textView = UITextView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: reuseIdentifier)
        titleLabel = UILabel(frame: CGRectMake(20, 10, self.bounds.size.width, 25))
//        textView = UITextView(frame: CGRectMake(20, 50, self.bounds.size.width, 100))
//        titleLabel.numberOfLines = 2
        titleLabel.textColor = UIColor.blueColor()
//        textView.textColor = UIColor.redColor()
        
        self.contentView.addSubview(titleLabel)
//        self.contentView.addSubview(textView)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
