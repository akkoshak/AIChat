//
//  Error+EXT.swift
//  AIChat
//
//  Created by Abdulkarim Koshak on 3/15/25.
//

import Foundation

extension Error {
    
    var eventParameters: [String: Any] {
        [
            "error_description": localizedDescription
        ]
    }
}
