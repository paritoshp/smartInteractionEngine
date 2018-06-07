//
//  ViewController.swift
//  smartInteractionEngine
//
//  Created by paritoshp on 06/06/2018.
//  Copyright (c) 2018 paritoshp. All rights reserved.
//

import UIKit
import smartInteractionEngine

@available(iOS 11.0, *)
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let vc = NFCViewController()
        self.present(vc, animated: true, completion: nil)
    }

}

