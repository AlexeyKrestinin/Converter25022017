//
//  ConverterViewController.swift
//  HelloSwift
//
//  Created by Алексей Крестинин on 25.02.17.
//  Copyright © 2017 Alexey Krestinin. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {

    var converter = Converter(forwardRatio: 1 / 61.9, backwardRatio:58.3, precision:2)
    
    
    @IBOutlet weak var converterView: ConverterView!

    
    //этот метод вызывается единажды за жизнь одного экрана и является 
    // отличной точкой для настройки и подготовки к работе
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    func setup () {
        
        // станем делегатом нашего ConverterView
        
        converterView.delegate = self
    }
    
}

extension ConverterViewController : ConverterViewDelegate
{
    // конвертация из рублей в евро
    func converterView(view: ConverterView, convertForward value: String?) {
        // попробуем извлечь число из строки
        guard let rubText = value,
            let rubles = Double(rubText.filterForNumberConvertion)
            // сразу не могли, тк Double не может принимать опциональные строки и значения
            else {
            view.fromValue = "Ошибка"
            return
        }
        // пересчитаем валюту из рублей
        let euroes = converter.convertForward(amount: rubles)
        // запишем новое значение в правое поле для ввода
        view.fromValue = "\(euroes) €"
        
    }
    
    // конвертация из евро в рубли
    func converterView(view: ConverterView, convertBackward value: String?) {
        guard let euroText = value,
            let euroes = Double(euroText.filterForNumberConvertion)
            // сразу не могли, тк Double не может принимать опциональные строки и значения
            else {
                view.toValue = ":("
                return
        }
        // пересчитаем валюту из рублей
        let rubles = converter.convertBackward(amount: euroes)
        // запишем новое значение в правое поле для ввода
        view.toValue = "\(rubles) ₽"
    }
}
