# Swift calendar component
Usage
========
1. Install ASCalendar pod
2. You can add the calendar to a placeholder view, so create an outlet for it.
<pre lang="Swift">
@IBOutlet var placeholderView: UIView!
</pre>
3. Your `viewDidLoad` method in the `Viewcontroller` should look like
<pre lang="Swift">
override func viewDidLoad() {
        super.viewDidLoad()
        
        // todays date.
        let date = NSDate()
    
        // Override calendar settings default
        calendarSettings = ASSettings(
          monthYearFormat: "LLLL yyyy",
          monthYearTextUppercase: false,
          monthRange: 24,
          dateSelectedImg: nil,
          weekHeaderHeight: 20,
          weekBgColor: "#93d1e6",
          weekFont: "OpenSans",
          weekFontSize: 11,
          weekTxtColor: "#fff",
          dateTxtColor: "#000",
          selectedDateTxtColor: "#fff",
          dateFont: "OpenSans",
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
</pre>
4. Implement the delegate method
<pre lang="Swift">
		func didSelectDate(date: NSDate) {
        println("\(date.year)-\(date.month)-\(date.day)")
    }
</pre>
Make sure your `Viewcontroller` class conforms to `CalendarViewDelegate` protocol.


License
========
The MIT License (MIT)

Copyright (c) 2015 Lancy

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
