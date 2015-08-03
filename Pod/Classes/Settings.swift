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
  public var monthYearTextUppercase: Bool
  // Month range of calendar
  public var monthRange: Int
  // date selected image
  public var dateSelectedImg: UIImage?
  public var disableTouchOnPastDate: Bool
  
  // Week config UI
  public var weekHeaderHeight: CGFloat
  public var weekBgColor: String
  public var weekFont: String
  public var weekFontSize: CGFloat
  public var weekTxtColor: String
  
  // Date config UI
  public var dateTxtColor: String
  public var selectedDateTxtColor: String
  public var dateFont: String
  public var dateFontSize: CGFloat
  
  // Alpla for disabled date
  public var dateAlpha: CGFloat
  
  public init(monthYearFormat: String, monthYearTextUppercase: Bool, monthRange: Int, dateSelectedImg: UIImage?, disableTouchOnPastDate: Bool, weekHeaderHeight: CGFloat, weekBgColor: String, weekFont: String, weekFontSize: CGFloat, weekTxtColor: String, dateTxtColor: String, selectedDateTxtColor: String, dateFont: String, dateFontSize: CGFloat, dateAlpha: CGFloat) {
    self.monthYearFormat = monthYearFormat
    self.monthYearTextUppercase = monthYearTextUppercase
    self.monthRange = monthRange
    self.dateSelectedImg = dateSelectedImg
    self.disableTouchOnPastDate = disableTouchOnPastDate
    self.weekHeaderHeight = weekHeaderHeight
    self.weekBgColor = weekBgColor
    self.weekFont = weekFont
    self.weekFontSize = weekFontSize
    self.weekTxtColor = weekTxtColor
    self.dateTxtColor = dateTxtColor
    self.selectedDateTxtColor = selectedDateTxtColor
    self.dateFont = dateFont
    self.dateFontSize = dateFontSize
    self.dateAlpha = dateAlpha
  }
  
}

// default calendar settings
public var calendarSettings = ASSettings(
  monthYearFormat: "LLLL yyyy",
  monthYearTextUppercase: false,
  monthRange: 12,
  dateSelectedImg: nil,
  disableTouchOnPastDate: false,
  weekHeaderHeight: 35,
  weekBgColor: "#fff",
  weekFont: "Helvetica Neue",
  weekFontSize: 11,
  weekTxtColor: "#000",
  dateTxtColor: "#000",
  selectedDateTxtColor: "#fff",
  dateFont: "Helvetica Neue",
  dateFontSize: 15,
  dateAlpha: 0.4
)
