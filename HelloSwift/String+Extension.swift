//
//  String+Extension.swift
//  HelloSwift
//
//  Created by Алексей Крестинин on 25.02.17.
//  Copyright © 2017 Alexey Krestinin. All rights reserved.
//

import Foundation

extension String {
    var filterForNumberConvertion:String {
        let allowedChars = "1234567890.,".characters
        
        let result = self.characters.filter { char -> Bool in
            // проверим, содержится ли каждый символ строки в наборе разрешенных символов
            let contains = allowedChars.contains(char)
            return contains
    }
        return String(result)
    }
}
