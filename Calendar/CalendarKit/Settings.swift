//
//  Settings.swift
//  Calendar
//
//  Created by Trung Pham on 7/21/15.
//  Copyright (c) 2015 Lancy. All rights reserved.
//

import UIKit

struct ASSettings {
  var monthFormat: String
  var monthRange: Int
  var dateSelectedImg: UIImage?
  
  var weekBgColor: String
  var weekFont: String
  var weekFontSize: CGFloat
  var weekTxtColor: String
  
  var dateTxtColor: String
  var dateFont: String
  var dateFontSize: CGFloat
  var dateAlpha: CGFloat
  
  
}

// default calendar settings
var calendarSettings = ASSettings(
  monthFormat: "LLLL yyyy",
  monthRange: 12,
  dateSelectedImg: nil,
  weekBgColor: "#fff",
  weekFont: "Helvetica Neue",
  weekFontSize: 11,
  weekTxtColor: "#000",
  dateTxtColor: "#000",
  dateFont: "Helvetica Neue",
  dateFontSize: 15,
  dateAlpha: 0.4
)
