//
//  ViewController.swift
//  RxTest
//
//  Created by 松本 隆 on 2017/01/13.
//  Copyright © 2017年 Favy. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    var disposeBag = DisposeBag()
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var rxSwitch: UISwitch!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        button.rx.tap
            .subscribe(onNext: { [weak self] in
                self!.label.text = "ButtonTapped"
            })
            .addDisposableTo(disposeBag)
        
        rxSwitch.rx.isOn
            .subscribe(onNext: { [weak self] bool in
                self!.label.text = bool ? "SwitchOn" : "SwitchOff"
            }).addDisposableTo(disposeBag)
        
        stepper.rx.value
            .subscribe(onNext: { [weak self] value in
                self!.label.text = String(value)
                }).addDisposableTo(disposeBag)
        
        textField.rx.text
            .subscribe(onNext: { [weak self] text in
                self!.label.text = text
            }).addDisposableTo(disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
