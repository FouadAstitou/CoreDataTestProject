//
//  CustomNewsItemCell.swift
//  OrbitNews
//
//  Created by Supervisor on 18-09-16.
//  Copyright © 2016 Nerdvana. All rights reserved.
//

import UIKit

class CustomNewsItemCell: UITableViewCell {

    // MARK: - properties
    var titleLabel = UILabel()
    var textView = UITextView()
    var dateLabel = UILabel()
    
    // MARK: - inits
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: reuseIdentifier)
        
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - configureView
    func configureView() {
        
        // Sets the sizes and locations of the sub views.
        titleLabel = UILabel(frame: CGRectMake(20, 10, self.frame.width, 44))
        textView = UITextView(frame: CGRectMake(15, 50, self.frame.width, 120))
        dateLabel = UILabel(frame: CGRectMake(20, 170, self.frame.width, 22))
        
        // Changes the text colors of the subviews.
        titleLabel.textColor = UIColor.darkGrayColor()
        textView.textColor = UIColor.grayColor()
        dateLabel.textColor = UIColor.grayColor()
        
        // Changes the fonts of the sub views.
        titleLabel.font = UIFont(name: "Helvetica Neue", size: 15)
        textView.font = UIFont(name: "Helvetica Neue", size: 12)
        dateLabel.font = UIFont(name: "Helvetica Neue", size: 10)
        
        // Sets the number of lines for the title label.
        titleLabel.numberOfLines = 2
        
        // Disables the user interaction.
        textView.userInteractionEnabled = false
        
        // Adds the sub views to the content view.
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(textView)
        self.contentView.addSubview(dateLabel)
        
    }

}
