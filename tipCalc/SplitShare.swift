//
//  SplitShare.swift
//  tipCalc
//
//  Created by Thomas Richardson on 8/19/16.
//  Copyright © 2016 Thomas Richardson. All rights reserved.
//

import Foundation

class SplitShare {
    
    private var _numberOf = 0.0

    var numberOfSharers : Double {
        get {
            return _numberOf
        } set {
            _numberOf = newValue
        }
    }
    

    
    init( numberOfSharers : Double) {
        _numberOf = numberOfSharers
    }
    
}
