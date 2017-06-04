//
//  FileReader.swift
//  AVDemo
//
//  Created by Deepak Sharma on 03/06/17.
//  Copyright © 2017 Deepak Sharma. All rights reserved.
//

import UIKit

class FileReader: NSObject {
    //read locally file
    class func readAudioFiles() -> [String] {
        return Bundle.main.paths(forResourcesOfType: "mp3", inDirectory: nil)
    }
    
}
