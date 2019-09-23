//
//  TimerModel.swift
//  Otus_FirstHomeWork
//
//  Created by Zimma on 22.09.2019.
//  Copyright © 2019 Zimma. All rights reserved.
//

protocol TimerModelDelegate: class {
    func changeTime(newTime: String)
}

import Foundation

class TimerModel: NSObject {
    
    fileprivate var timer = Timer()
    
    fileprivate var time = 0 {
        willSet {
            stringTime = "\(newValue / 60) : \(newValue % 60)"
        }
    }
    
    var stringTime = "0 : 0"
    
    var timerIsPaused = false {
        willSet {
            if newValue {
                startTimer()
            } else {
                timer.invalidate()
            }
        }
    }
    
    var delegate: TimerModelDelegate?
    
    var timerIsOn = false {
        willSet {
            if newValue {
                startTimer()
            } else {
                stopTimer()
            }
        }
    }
    
    fileprivate func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    
    fileprivate func stopTimer() {
        timer.invalidate()
        time = 0
        delegate?.changeTime(newTime: stringTime)
    }
    
    @objc fileprivate func fireTimer() {
        time += 1
        print(stringTime)
        delegate?.changeTime(newTime: stringTime)
    }
}
