//
//  ViewController.swift
//  NSDate_Extension
//
//  Created by 李庆彬 on 2/26/16.
//  Copyright © 2016 LQB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let preDate = NSDate.init(timeIntervalSinceNow: -1708700);
        let time = preDate.timeIntervalSince1970;
        print(NSDateTool.time(time));
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

