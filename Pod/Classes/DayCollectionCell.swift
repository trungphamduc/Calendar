//
//  DayCollectionCell.swift
//  Calendar
//
//  Created by Lancy on 02/06/15.
//  Copyright (c) 2015 Lancy. All rights reserved.
//

import UIKit

class DayCollectionCell: UICollectionViewCell {
  
  @IBOutlet var label: UILabel!
  
  @IBOutlet var markedView: UIView!
  @IBOutlet var markedViewWidth: NSLayoutConstraint!
  @IBOutlet var markedViewHeight: NSLayoutConstraint!
  
  var date: Date? {
    didSet {
      if date != nil {
        label.text = "\(date!.day)"
      } else {
        label.text = ""
      }
      label.font = UIFont(name: calendarSettings.dateFont, size: calendarSettings.dateFontSize)
      label.textColor = UIColor(rgba: calendarSettings.dateTxtColor)
    }
  }
  
  var disabled: Bool = false {
    didSet {
      if disabled {
        alpha = calendarSettings.dateAlpha
      } else {
        alpha = 1.0
      }
    }
  }
  
  var mark: Bool = false {
    didSet {
      if mark {
        markedView!.hidden = false
        label.textColor = UIColor(rgba: calendarSettings.selectedDateTxtColor)
      } else {
        markedView!.hidden = true
      }
    }
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    // Update UI for day selected
    markedViewWidth!.constant = min(self.frame.width, self.frame.height)
    markedViewHeight!.constant = min(self.frame.width, self.frame.height)
    
    // Update selected calendar UI
    if calendarSettings.dateSelectedImg == nil {
      markedView!.layer.cornerRadius = min(self.frame.width, self.frame.height) / 2.0
      markedView.backgroundColor = UIColor.redColor()
      
    } else {
      markedView.backgroundColor = UIColor(patternImage: calendarSettings.dateSelectedImg!)
    }
    
    
  }
  
}
