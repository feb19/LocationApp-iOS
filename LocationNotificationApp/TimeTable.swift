//
//  TimeTable.swift
//  LocationNotificationApp
//
//  Created by Nobuhiro Takahashi on 2018/06/23.
//  Copyright © 2018年 Nobuhiro Takahashi. All rights reserved.
//

import Foundation

enum TrainType {
    case Normal
    case Rapid
    case Express
}

struct TrainTime {
    let hour: Int
    let minutes: Int
    let type: TrainType
    let destination: String
    
    init(hour: Int, minutes: Int, type: TrainType, destination: String) {
        self.hour = hour
        self.minutes = minutes
        self.type = type
        self.destination = destination
    }
}

// http://transfer.navitime.biz/tokyu/pc/diagram/TrainDiagram?stCd=00002454&rrCd=00000789&updown=0
let tt = TrainTime(hour: 5, minutes: 9, type: .Normal, destination: "久喜")

struct TimeTable {
    struct Mizonokuchi {
        struct Nobori {
            
        }
    }
}
