//
//  HelloSwiftViewController.swift
//  HelloSwift
//
//  Created by Алексей Крестинин on 25.02.17.
//  Copyright © 2017 Alexey Krestinin. All rights reserved.
//

import UIKit

class HelloSwiftViewController: UIViewController {

    @IBOutlet weak var nameInput: UITextField!
 
    @IBAction func helloButtonPressed(_ sender: UIButton) {
        // убедимся что в поле для ввода есть какой то текст
        guard nameInput?.text?.isEmpty == false,
            // считаем текст с поля для ввода
        let userName = nameInput?.text else {
            return
        }
        let greeting = "Здравствуйте, \(userName)"
        // создадим контроллер который показывает всплывающее сообщение
        let alert = UIAlertController(title: "Ураааа", message: greeting, preferredStyle: .alert)
        // создадим кнопку для всплывающего сообщения
            let helloAction = UIAlertAction(title: "Привет", style: .default) { action in
                print ("Пользователь нажал \(action)")
        }
        //добавим кнопку на новый контроллер
        alert.addAction(helloAction)
        
        //представим на экране всплывающее сообщение
        present(alert, animated: true, completion: nil )
        
    }
}





