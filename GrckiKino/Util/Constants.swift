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
    static let fullDateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateStyle = .medium
        df.timeStyle = .short
        df.dateFormat = "dd.MM H:mm"
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
    static func getResultsFor(_ date: String) -> URL {
        return URL(string : "https://api.opap.gr/draws/v3.0/1100/draw-date/\(date)/\(date)")!
    }
    static let oddsArray: [Int] = [20000,10000,7000,5000,2500,1500,1400,1200,1000,800,500,250,200,100,50]
    
    static let json =
        """
        [
        {
        "gameId": 1100,
        "drawId": 843705,
        "drawTime": 1605045300000,
        "drawBreak": 0,
        "visualDraw": 843705,
        "winningNumbers": {
                        "list": [
                            76,
                            49,
                            29,
                            79,
                            71,
                            13,
                            46,
                            8,
                            45,
                            68,
                            38,
                            9,
                            12,
                            66,
                            44,
                            15,
                            69,
                            43,
                            37,
                            2
                        ]
        }
        },
        {
        "gameId": 1100,
        "drawId": 343705,
        "drawTime": 1605075300000,
        "drawBreak": 0,
        "visualDraw": 443705,
        "winningNumbers": {
                        "list": [
                            65,
                            34,
                            59,
                            17,
                            29,
                            68,
                            14,
                            41,
                            15,
                            25,
                            16,
                            51,
                            20,
                            12,
                            6,
                            46,
                            48,
                            5,
                            26,
                            60
        ],
        }
        }
        ]
        """
}
