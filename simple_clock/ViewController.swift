//
//  ViewController.swift
//  simple_clock
//
//  Created by Trung on 23/10/24.
//

import UIKit

class ViewController: UIViewController {

    var timer: Timer?
    var countdownTime: Int = 0*60*60 + 1*60
    @IBOutlet weak var clock: UILabel!
    
    
    		
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startClock()
    }
    
    func startClock(){
        updateTime()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime(){
        if countdownTime > 0{
            countdownTime -= 1
            var hour = countdownTime / 3600
            var minute = (countdownTime % 3600) / 60
            var second = countdownTime % 60
            clock.text = String(format: "%02d:%02d:%02d", hour,minute,second)
        }
        else{
            timer?.invalidate()
            clock.text = "00:00:00"

        }
    }
    deinit{
        timer?.invalidate()
    }

}

