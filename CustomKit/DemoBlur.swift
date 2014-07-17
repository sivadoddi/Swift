//
//  DemoBlur.swift
//  sampleSwift
//
//  Created by SivaSankar on 16/07/14.
//  Copyright (c) 2014 Paradim Creatives. All rights reserved.
//

import UIKit

@IBDesignable
class DemoBlur: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        var testLabel:UILabel = UILabel(frame: CGRectMake(0, 20, 100, 20))
        testLabel.text = "Hello"
        testLabel.textColor = UIColor.greenColor()
        self.addSubview(testLabel)
        
    }

}
