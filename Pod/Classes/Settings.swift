//
//  Settings.swift
//  Calendar
//
//  Created by Trung Pham on 7/21/15.
//  Copyright (c) 2015 Lancy. All rights reserved.
//

import UIKit

public struct ASSettings {
  // header month-year formar
  public var monthYearFormat: String
  // Month range of calendar
  public var monthRange: Int
  // date selected image
  public var dateSelectedImg: UIImage?
  
  // Week config UI
  public var weekBgColor: String
  public var weekFont: String
  public var weekFontSize: CGFloat
  public var weekTxtColor: String
  
  // Date config UI
  public var dateTxtColor: String
  public var dateFont: String
  public var dateFontSize: CGFloat
  
  // Alpla for disabled date
  public var dateAlpha: CGFloat
  
  public init(monthYearFormat: String, monthRange: Int, dateSelectedImg: UIImage?, weekBgColor: String, weekFont: String, weekFontSize: CGFloat, weekTxtColor: String, dateTxtColor: String, dateFont: String, dateFontSize: CGFloat, dateAlpha: CGFloat) {
    self.monthYearFormat = monthYearFormat
    self.monthRange = monthRange
    self.dateSelectedImg = dateSelectedImg
    self.weekBgColor = weekBgColor
    self.weekFont = weekFont
    self.weekFontSize = weekFontSize
    self.weekTxtColor = weekTxtColor
    self.dateTxtColor = dateTxtColor
    self.dateFont = dateFont
    self.dateFontSize = dateFontSize
    self.dateAlpha = dateAlpha
  }
  
}

// default calendar settings
public var calendarSettings = ASSettings(
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
