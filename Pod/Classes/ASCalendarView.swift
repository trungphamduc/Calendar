//
//  ASCalendarView.swift
//  Pods
//
//  Created by Trung Pham on 7/23/15.
//
//

import UIKit
import Foundation

public class ASCalendarView: UIView {

  public class func instantiateFromNib<T: UIView>(viewType: T.Type) -> T {
    
    return NSBundle(forClass: self.dynamicType) as! T
  }
  
  public class func instantiateFromNib() -> Self {
    return instantiateFromNib(self)
  }
  
  public class func instance(baseDate: NSDate, selectedDate: NSDate) -> ASCalendarView {
    
    let bundle = NSBundle(forClass: object_getClass(self))
    let nib = UINib(nibName: "ASCalendarView", bundle: bundle)
    
    // Assumes UIView is top level and only object in CustomView.xib file
    var calendarView = nib.instantiateWithOwner(self, options: nil)[0] as! ASCalendarView
    
    return calendarView
  }
}
