//
//  Settings.swift
//  Calendar
//
//  Created by Trung Pham on 7/21/15.
//  Copyright (c) 2015 Lancy. All rights reserved.
//

import UIKit

struct ASSettings {
  // header month-year formar
  var monthYearFormat: String
  // Month range of calendar
  var monthRange: Int
  // date selected image
  var dateSelectedImg: UIImage?
  
  // Week config UI
  var weekBgColor: String
  var weekFont: String
  var weekFontSize: CGFloat
  var weekTxtColor: String
  
  // Date config UI
  var dateTxtColor: String
  var dateFont: String
  var dateFontSize: CGFloat
  
  // Alpla for disabled date
  var dateAlpha: CGFloat
  
  
}

// default calendar settings
var calendarSettings = ASSettings(
  monthYearFormat: "LLLL yyyy",
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
