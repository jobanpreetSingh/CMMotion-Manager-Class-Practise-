//
//  ViewController.swift
//  CMMotionSensorDEtectionApp
//
//  Created by Joban Dhot on 2019-01-24.
//  Copyright © 2019 Joban Dhot. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    @IBOutlet weak var X: UILabel!
    @IBOutlet weak var Y: UILabel!
    @IBOutlet weak var Z: UILabel!
    var motionManager: CMMotionManager!
    override func viewDidLoad() {
        super.viewDidLoad()
       motionManager = CMMotionManager()
      motionManager.startAccelerometerUpdates(to: .main, withHandler: updatelabels)
    
        
    }

    func updatelabels(data: CMAccelerometerData?, erroe: Error?){
        guard let accelerometerData = data else {
            return
        }
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 1
        formatter.minimumFractionDigits = 1
        let x = formatter.string(for: accelerometerData.acceleration.x)!
        let y = formatter.string(for: accelerometerData.acceleration.y)!
        let z = formatter.string(for: accelerometerData.acceleration.z)!
        
        X.text = "X:\(x)"
        Y.text = "Y:\(y)"
        Z.text = "Z:\(z)"
        

    }
}

