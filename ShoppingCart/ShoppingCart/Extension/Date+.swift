//
//  Date+.swift
//  ShoppingCart
//
//  Created by Yeri Hwang on 2023/12/27.
//

import Foundation

extension Date {
    
    func timeAgo() -> String {
        let calendar = Calendar.current
        let now = Date()
        
        // 오늘이면
        if calendar.isDateInToday(self) {
            let components = calendar.dateComponents([.hour, .minute], from: self, to: now)
            
            if let hour = components.hour, hour > 0 {
                return "\(hour)시간 전"
            } else if let minute = components.minute, minute > 0 {
                return "\(minute)분 전"
            } else {
                return "방금"
            }
        // 어제인 경우
        } else if calendar.isDateInYesterday(self) {
            return "어제"
        } else {
            let components = calendar.dateComponents([.day], from: self, to: now)
            if let day = components.day, day > 0 {
                if day > 30 {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    return dateFormatter.string(from: self)
                } else {
                    return "\(day)일 전"
                }
            }
            // 30일 이상인 경우
            else {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                return dateFormatter.string(from: self)
            }
        }
    }
    
    func formatDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let str = dateFormatter.string(from: self)
        return str
    }
    
}
    
