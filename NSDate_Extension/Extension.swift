//
//  Extension.swift
//  NSDate_Extension
//
//  Created by 李庆彬 on 2/26/16.
//  Copyright © 2016 LQB. All rights reserved.
//

import Foundation


extension NSDate {
     func isThisYear() -> Bool {
        let unitFlags:NSCalendarUnit = NSCalendarUnit.Year;
        let calendar = NSCalendar.currentCalendar();
        let components = calendar.components(unitFlags, fromDate: self);
        let now = calendar.components(unitFlags, fromDate: NSDate())
        return components.year == now.year;
    }
    
    func isYesterday() -> Bool {
        let dateFormatter = NSDateFormatter.init();
        dateFormatter.dateFormat = "yyyy--MM--dd";
        let dateString = dateFormatter.stringFromDate(self);
        let nowString = dateFormatter.stringFromDate(NSDate());
        
        let preDate = dateFormatter.dateFromString(dateString);
        let nowDate = dateFormatter.dateFromString(nowString);
        
        let unitFlags:NSCalendarUnit = [.Day, .Month, .Year];
        let calendar = NSCalendar.currentCalendar();
        let components = calendar.components(unitFlags, fromDate: preDate!, toDate: nowDate!, options: NSCalendarOptions.WrapComponents)
        if (components.year == 0 && components.month == 0 && components.day == 1 ) {
            return true;
        }else {
            return false;
        }
    }
    
    func isToday() -> Bool {
        let dateFormatter = NSDateFormatter.init();
        dateFormatter.dateFormat = "yyyy--MM--dd";
        let dateString = dateFormatter.stringFromDate(self);
        let nowString = dateFormatter.stringFromDate(NSDate());
        return dateString == nowString;
    }
}


class NSDateTool: NSObject {
    static func time(timeInterval:NSTimeInterval) -> String {
        let now = NSDate();//获取当前时间
        let preDate = NSDate.init(timeIntervalSince1970: timeInterval);//获取要处理的时间
        let calendar = NSCalendar.currentCalendar();//日期对象
        let unitFlags: NSCalendarUnit = [.Second, .Minute, .Hour, .Day, .Month, .Year];
        //枚举要比较的时间，比如 Year为年，就是两个时间之间年份的差值
        let components = calendar.components(unitFlags, fromDate: preDate, toDate: now, options:NSCalendarOptions.WrapComponents)
        let dateFormatter = NSDateFormatter.init();
        if (preDate.isThisYear()) {
            if (preDate.isYesterday()) {
                dateFormatter.dateFormat = "昨天 HH:mm";
                return dateFormatter.stringFromDate(preDate);
            }else if (preDate.isToday()) {
                if (components.hour >= 1) {
                    return String(components.hour) + "小时前";
                }else if (components.minute >= 1) {
                    return String(components.minute) + "分钟前";
                }else {
                    return "刚刚";
                }
            }else {
                dateFormatter.dateFormat = "MM--dd HH:mm";
                return dateFormatter.stringFromDate(preDate);
            }
        }else {
            dateFormatter.dateFormat = "yyyy--MM--dd HH:mm";
            return dateFormatter.stringFromDate(preDate);
        }
    }
}


