//
//  ViewController.swift
//  Calendar
//
//  Created by Lancy on 01/06/15.
//  Copyright (c) 2015 Lancy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CalendarViewDelegate {
  
  @IBOutlet var placeholderView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // todays date.
    let date = NSDate()
    
    // Override calendar settings default
    calendarSettings = ASSettings(
      monthYearFormat: "LLLL yyyy",
      monthRange: 24,
      dateSelectedImg: nil,
      weekBgColor: "#93d1e6",
      weekFont: "Helvetica Neue",
      weekFontSize: 10,
      weekTxtColor: "#fff",
      dateTxtColor: "#000",
      dateFont: "Helvetica Neue",
      dateFontSize: 15,
      dateAlpha: 0.4
    )
    
    // create an instance of calendar view with
    // base date (Calendar shows 12 months range from current base date)
    // selected date (marked dated in the calendar)
    
    let calendarView = CalendarView.instance(date, selectedDate: date)
    calendarView.delegate = self
    calendarView.setTranslatesAutoresizingMaskIntoConstraints(false)
    placeholderView.addSubview(calendarView)
    
    // Custom calendar header
    calendarView.headerView.backgroundColor = UIColor.redColor()
    calendarView.monthYearLabel.backgroundColor = UIColor.redColor()
    calendarView.nextButton.setTitle("", forState: UIControlState.Normal)
    calendarView.previousButton.setTitle("", forState: UIControlState.Normal)
    
    // Constraints for calendar view - Fill the parent view.
    placeholderView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[calendarView]|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["calendarView": calendarView]))
    placeholderView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[calendarView]|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["calendarView": calendarView]))
  }
  
  func didSelectDate(date: NSDate) {
    // date selected delegate
    // println("\(date.year)-\(date.month)-\(date.day)")
  }
}

