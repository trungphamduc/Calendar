//
//  CalendarView.swift
//  Calendar
//
//  Created by Lancy on 02/06/15.
//  Copyright (c) 2015 Lancy. All rights reserved.
//

import Foundation
import UIKit

// Global variable for save selected date
var selectedDateCached: Date?

public protocol CalendarViewDelegate: class {
   func didSelectDate(date: NSDate)
}

public class CalendarView: UIView {
  
  @IBOutlet weak public var headerView: UIView!
  @IBOutlet public var monthYearLabel: UILabel!
  @IBOutlet public var collectionView: UICollectionView!
  @IBOutlet public var nextButton: UIButton!
  @IBOutlet public var previousButton: UIButton!
  weak public var delegate: CalendarViewDelegate?
  
  private var collectionData = [CalendarLogic]()
  var baseDate: NSDate? {
    didSet {
      collectionData = [CalendarLogic]()
      if baseDate != nil {
        var dateIter1 = baseDate!, dateIter2 = baseDate!
        var set = Set<CalendarLogic>()
        set.insert(CalendarLogic(date: baseDate!))
        // advance one year
        for var i = 0; i < calendarSettings.monthRange; i++ {
          dateIter1 = dateIter1.firstDayOfFollowingMonth
          dateIter2 = dateIter2.firstDayOfPreviousMonth
          
          set.insert(CalendarLogic(date: dateIter1))
          set.insert(CalendarLogic(date: dateIter2))
        }
        collectionData = sorted(Array(set), <)
      }
      
      updateHeader()
      
      collectionView.reloadData()
    }
  }
  
  var selectedDate: NSDate? {
    didSet {
      
      if calendarSettings.disableTouchOnPastDate {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let currentTime = dateFormatter.stringFromDate(NSDate())
        let selectedTime = dateFormatter.stringFromDate(dateFormatter.dateFromString("\(selectedDate!.year)-\(selectedDate!.month)-\(selectedDate!.day)")!)
        let compareResult = selectedTime.compare(currentTime)
        
        if compareResult == NSComparisonResult.OrderedDescending || compareResult == NSComparisonResult.OrderedSame {
          collectionView.reloadData()
        } else {
          selectedDate = dateFormatter.dateFromString("\(selectedDateCached!.year)-\(selectedDateCached!.month)-\(selectedDateCached!.day)")
        }
        
      } else {
        collectionView.reloadData()
      }
      
      dispatch_async(dispatch_get_main_queue()){
        self.moveToSelectedDate(false)
        if self.delegate != nil {
          self.delegate!.didSelectDate(self.selectedDate!)
        }
      }
    }
  }
  
  override public init(frame: CGRect) {
    super.init(frame: frame)
  }

  
  required public init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  public override func awakeFromNib() {
    super.awakeFromNib()
    let bundle = NSBundle(forClass: object_getClass(self))
    let nib = UINib(nibName: "MonthCollectionCell", bundle: bundle)
    
    self.collectionView.registerNib(nib, forCellWithReuseIdentifier: "MonthCollectionCell")
    
  }
  
  public class func instantiateFromNib<T: UIView>(viewType: T.Type) -> T {
    return NSBundle.mainBundle().loadNibNamed(NSStringFromClass(viewType).pathExtension, owner: nil, options: nil).first as! T
  }
  
  public class func instantiateFromNib() -> Self {
    return instantiateFromNib(self)
  }
  
  public class func instance(baseDate: NSDate, selectedDate: NSDate) -> CalendarView {
    
    let bundle = NSBundle(forClass: object_getClass(self))
    let nib = UINib(nibName: "CalendarView", bundle: bundle)
    
    // Assumes UIView is top level and only object in CustomView.xib file
    var calendarView = nib.instantiateWithOwner(self, options: nil)[0] as! CalendarView

    calendarView.selectedDate = selectedDate
    calendarView.baseDate = baseDate

    return calendarView
  }
  
  func updateHeader() {
    let pageNumber = Int(collectionView.contentOffset.x / collectionView.frame.width)
    updateHeader(pageNumber)
  }
  
  func updateHeader(pageNumber: Int) {
    if collectionData.count > pageNumber {
      let logic = collectionData[pageNumber]
      if (calendarSettings.monthYearTextUppercase) {
        monthYearLabel?.text = logic.currentMonthAndYear.uppercaseString as String
      } else {
        monthYearLabel?.text = logic.currentMonthAndYear as String
      }
    }
  }
  
  @IBAction func retreatToPreviousMonth(button: UIButton) {
    advance(-1, animate: true)
  }
  
  @IBAction func advanceToFollowingMonth(button: UIButton) {
    advance(1, animate: true)
  }
  
  func advance(byIndex: Int, animate: Bool) {
    var visibleIndexPath = self.collectionView.indexPathsForVisibleItems().first as! NSIndexPath
    
    if (visibleIndexPath.item == 0 && byIndex == -1) ||
      ((visibleIndexPath.item + 1) == collectionView.numberOfItemsInSection(0) && byIndex == 1) {
        return
    }
    
    visibleIndexPath = NSIndexPath(forItem: visibleIndexPath.item + byIndex, inSection: visibleIndexPath.section)
    updateHeader(visibleIndexPath.item)
    collectionView.scrollToItemAtIndexPath(visibleIndexPath, atScrollPosition: .CenteredHorizontally, animated: animate)
  }
  
  func moveToSelectedDate(animated: Bool) {
    var index = -1
    for var i = 0; i < collectionData.count; i++  {
      let logic = collectionData[i]
      if logic.containsDate(selectedDate!) {
        index = i
        break
      }
    }
    
    if index != -1 {
      let indexPath = NSIndexPath(forItem: index, inSection: 0)
      updateHeader(indexPath.item)
      collectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: .CenteredHorizontally, animated: animated)
    }
  }
  

}

extension CalendarView: UICollectionViewDataSource {
  public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return collectionData.count
  }
  
  public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MonthCollectionCell", forIndexPath: indexPath) as! MonthCollectionCell
    
    cell.monthCellDelgate = self
    
    cell.logic = collectionData[indexPath.item]
    if cell.logic!.isVisible(selectedDate!) {
      cell.selectedDate = Date(date: selectedDate!)
    }
    
    return cell
  }
  
  public func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    return collectionView.frame.size
  }
}

extension CalendarView: UICollectionViewDelegateFlowLayout {
  
}

extension CalendarView: MonthCollectionCellDelegate {
  //MARK: Month cell delegate.
  func didSelect(date: Date) {
    selectedDate = date.nsdate
  }
}

extension CalendarView: UIScrollViewDelegate{
  public func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    if (!decelerate) {
      updateHeader()
    }
  }
  
  public func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
    updateHeader()
  }
}