//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by Chuan Yu Leng on 4/28/15.
//  Copyright (c) 2015 MatchVZ. All rights reserved.
//

import Foundation

class RecordedAudio {
    var filePathUrl: NSURL!
    var title: String!
    
    init(filePathUrl:NSURL!, title:String!){
        self.filePathUrl = filePathUrl
        self.title = title
    }    
}