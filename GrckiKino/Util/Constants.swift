//
//  Constants.swift
//  GrckiKino
//
//  Created by Lazar Stojkovic on 28.11.20..
//

import Foundation

struct Constants {
    
    static let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy-mm-dd"
        return df
    }()
    static let dayMonthFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "dd.mm"
        return df
    }()
    static let timeFormatter: DateFormatter = {
        let df = DateFormatter()
        //df.locale = Locale(identifier: "en_US_POSIX")
        df.dateStyle = .none
        df.timeStyle = .short
        df.dateFormat = "H:mm"
        return df
    }()
    
    static let ballDrawingURL: URL = URL(string : "https://ds.opap.gr/web_kino/kinoIframe.html?link=https://ds.opap.gr/web_kino/kino/html/Internet_PRODUCTION/KinoDraw_201910.html&resolution=847x500")!
    static let upcomingURL: URL = URL(string : "https://api.opap.gr/draws/v3.0/1100/upcoming/20")!
    static func getUpcomingDraw(_ drawID: Int) -> URL {
        return URL(string : "https://api.opap.gr/draws/v3.0/1100/\(drawID)")!
    }
    
}
