//
//  ViewController.swift
//  ASCalendar
//
//  Created by Trung Pham Duc on 07/23/2015.
//  Copyright (c) 2015 Trung Pham Duc. All rights reserved.
//

import UIKit
import ASCalendar

class ViewController: UIViewController {

  @IBOutlet var placeholderView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
      // todays date.
      let date = NSDate()
      
      // Override calendar settings default
      calendarSettings = ASSettings(
        monthYearFormat: "LLLL yyyy",
        monthYearTextUppercase: true,
        monthRange: 24,
        dateSelectedImg: nil,
        disableTouchOnPastDate: true,
        weekHeaderHeight: 20,
        weekBgColor: "#93d1e6",
        weekFont: "Helvetica Neue",
        weekFontSize: 10,
        weekTxtColor: "#fff",
        dateTxtColor: "#000",
        selectedDateTxtColor: "#fff",
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
      
      // Pulbic calendar header - Custom UI of calendar header
      calendarView.headerView.backgroundColor = UIColor.redColor()
      calendarView.monthYearLabel.backgroundColor = UIColor.redColor()
      calendarView.nextButton.setTitle("", forState: UIControlState.Normal)
      calendarView.previousButton.setTitle("", forState: UIControlState.Normal)
      
      // Constraints for calendar view - Fill the parent view.
      placeholderView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[calendarView]|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["calendarView": calendarView]))
      placeholderView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[calendarView]|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["calendarView": calendarView]))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: CalendarViewDelegate {
  func didSelectDate(date: NSDate) {
    println("\(date.year)-\(date.month)-\(date.day)")
  }
}
