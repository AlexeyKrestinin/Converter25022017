//
//  ConverterView.swift
//  HelloSwift
//
//  Created by Алексей Крестинин on 25.02.17.
//  Copyright © 2017 Alexey Krestinin. All rights reserved.
//

import UIKit


// чтобы можно было иметь слабую ссылку 
// зададим наследование протокола от протокола class
protocol ConverterViewDelegate:class {
        func converterView(view:ConverterView,convertForward value:String?)
        
        func converterView (view: ConverterView, convertBackward value:String?)
    }


    class ConverterView: UIView {
    // Слабая ссылка нужна, потому, что принято на делегата хранить слабую ссылку (а во view скорее всего 
    // будет сильная) иначе, они всегда будут лежать в памяти
       weak var delegate:ConverterViewDelegate?
        var toValue:String? { // левое поле
            
            set {
                toTextField?.text = newValue
            }
            get {
                return toTextField?.text
            }
        }
        var fromValue:String? { //правое поле
            get {
               return fromTextField?.text
            }
            set {
                fromTextField?.text = newValue
            }
        }
// private - чтобы не было видно другим эти строки ввода
    @IBOutlet private weak var toTextField:UITextField?
    @IBOutlet private weak var fromTextField:UITextField?
        
        
        
        @IBAction func forwardPressed() {
        delegate?.converterView(view: self, convertForward: fromValue)
        }
        @IBAction func backwardPressed() {
        delegate?.converterView(view: self, convertBackward: toValue)
        }
// закругление углов у view
        required init?(coder aDecoder:NSCoder) {
            super.init(coder:aDecoder)
            setup()
            
        }
        private func setup() {
            self.layer.cornerRadius = 5
            self.clipsToBounds = true
            
        }
        
}
