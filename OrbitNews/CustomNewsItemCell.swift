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
    var dateLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: reuseIdentifier)
        
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        
        titleLabel = UILabel(frame: CGRectMake(20, 10, self.frame.width, 44))
        textView = UITextView(frame: CGRectMake(15, 50, self.frame.width, 120))
        dateLabel = UILabel(frame: CGRectMake(20, 170, self.bounds.size.width, 22))
        
        titleLabel.textColor = UIColor.darkGrayColor()
        textView.textColor = UIColor.grayColor()
        
        
        titleLabel.font = titleLabel.font.fontWithSize(15)
        dateLabel.font = dateLabel.font.fontWithSize(10)
        
        titleLabel.numberOfLines = 2
        
        textView.userInteractionEnabled = false
        
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(textView)
        self.contentView.addSubview(dateLabel)
        
    }

}
