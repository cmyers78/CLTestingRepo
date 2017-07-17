//
//  ConversionValues.swift
//  programmaticImages
//
//  Created by Christopher Myers on 7/17/17.
//  Copyright © 2017 Dragoman Developers. All rights reserved.
//

import Foundation
import UIKit


enum RoomLocation {
    case one, two, three, four, five, six
    
    var valuePercentage : (CGFloat, CGFloat) {
        switch self {
        case .one:
            return (0.023, 0.431)
        case .two:
            return (0.250, 0.653)
        case .three:
            return (0.359, 0.500)
        case .four:
            return (0.539, 0.806)
        case .five:
            return (0.742, 0.778)
        case .six:
            return (0.781, 0.444)
        }
    }
}
