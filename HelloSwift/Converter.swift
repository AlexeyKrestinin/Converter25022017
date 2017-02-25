//
//  Converter.swift
//  HelloSwift
//
//  Created by Алексей Крестинин on 25.02.17.
//  Copyright © 2017 Alexey Krestinin. All rights reserved.
//

import Foundation

struct Converter {
    // Значения рублей
    let forwardRatio:Double
    // Значения евро
    let backwardRatio:Double
    
    // зададим степень округления
    var precision:Int
    
    // Конвертируем рубли в евро
    func convertForward (amount:Double) -> Double
    {
      return roundValue (amount: amount * forwardRatio, precision: self.precision)
        
    }
    
    func convertBackward (amount:Double) -> Double
    {
    return roundValue(amount: amount * backwardRatio, precision: self.precision)
    }
    // Реализуем метод округления до заданного значения
    private func roundValue(amount:Double,precision:Int) -> Double
    {
        // пусть amount = 2.5555
        // precision = 2
        // тогда multiply = 100
     let multiply = pow(10,Double(precision))
        // округляем число до целых (встроенная функция round
        // но тк мы его умножили несколько раз
        // round (2.5555 * 100) = round (255.5555)
        let newValue = round(amount*multiply)
        return newValue / multiply
    }
    
}
