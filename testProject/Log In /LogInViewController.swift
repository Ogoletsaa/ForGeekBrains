//
//  ViewController.swift
//  testProject
//
//  Created by Артем Оголец on 23.08.2018.
//  Copyright © 2018 Artem Ogolets. All rights reserved.
//

import UIKit
import UserNotifications

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    var activeTextField: UITextField!
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
  
    // Loading View Outlets
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var pugImageView: UIImageViewX!
    @IBOutlet weak var firstShield: UIImageView!
    @IBOutlet weak var secondShield: UIImageView!
    @IBOutlet weak var thirdShield: UIImageView!
    
    @IBAction func LogInBtn(_ sender: UIButton) {
        let usernameText = self.usernameText.text
        let passwordText = self.passwordText.text
    
        if usernameText == "" && passwordText == ""{
            print ("Авторизация прошла успешно")
        } else {
            // Создаем контроллер
            let warning = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя", preferredStyle: .alert)
            // Создаем кнопку для UIAlertController
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            // Добавляем кнопку на UIAlertController
            warning.addAction(action)
            // Показываем UIAlertController
            present(warning, animated: true, completion: nil)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showLoadingScreen()
        
    }
    
    //Loading View
    func showLoadingScreen() {
        
        loadingView.bounds.size.width = view.bounds.width
        loadingView.bounds.size.height = view.bounds.height
        loadingView.center = view.center
        self.firstShield.alpha = 0
        self.secondShield.alpha = 0
        self.thirdShield.alpha = 0
        //view.addSubview(loadingView)
        
        UIView.animate(withDuration: 0.3, animations: {self.loadingView.alpha = 1}, completion: {(success) in self.animateThirdShield()
        })
    }
    
    func animateThirdShield() {
        UIView.animate(withDuration: 1, delay: 0.1, options: [], animations: {self.firstShield.alpha = 1}, completion: {(success) in self.animateSecondShield()
        })
    }
    func animateSecondShield() {
        UIView.animate(withDuration: 1, delay: 0.1, options: [], animations: {self.secondShield.alpha = 1}, completion: {(success) in self.animateFirstShield()
        })
    }
    
    func animateFirstShield() {
        UIView.animate(withDuration: 1, delay: 0.1, options: [], animations: {self.thirdShield.alpha = 1},completion: {(success) in self.hideLoadScreen()
        })
        
    }
    
    func hideLoadScreen() {
        //Animate a bit down
        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {self.loadingView.transform = CGAffineTransform(translationX: 0, y: 10) }, completion:{(success) in
        //Animate up+remove
            UIView.animateKeyframes(withDuration: 0.6, delay: 0, options: [], animations: {self.loadingView.transform = CGAffineTransform(translationX: 0, y: -1000) }, completion: {(success) in self.loadingView.removeFromSuperview()
                }
            )}
        )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let center: NotificationCenter = NotificationCenter.default;
        center.addObserver(self, selector: #selector(self.keyboardDidShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        center.addObserver(self, selector: #selector(self.keyboardWillHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        let center: NotificationCenter = NotificationCenter.default;
        center.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        center.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print (#function)
    }
    
    @objc func keyboardDidShown(notification: Notification) {
        
        let info = notification.userInfo! as NSDictionary
        let keyboardSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        
        let contentInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
    
        scrollView.contentInset = contentInsets
    }
    
    @objc func keyboardWillHidden(notification: Notification) {
        
        let contentInsets = UIEdgeInsets.zero
        
        scrollView.contentInset = contentInsets
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        activeTextField = textField
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

