//
//  ViewController.swift
//  DatePicker
//
//  Created by 이윤수 on 2021/02/22.
//

import UIKit

class ViewController: UIViewController {
  let timeSelector: Selector = #selector(ViewController.updateTime)
  let interval = 1.0
  var alarmTime: String?
  var count = 0

  @IBOutlet var lbCurrentTime: UILabel!
  @IBOutlet var lbPickerTime: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true) //타이머 설정
  }
  @objc func updateTime() {
//    lbCurrentTime.text = String(count)
//    count = count + 1

    let date = NSDate()

    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
    lbCurrentTime.text = "현재시간: " + formatter.string(from: date as Date)
    formatter.dateFormat = "hh:mm aaa"
    let currentTime = formatter.string(from: date as Date)
    
    if (alarmTime == currentTime) {
      view.backgroundColor = UIColor.red
    }
    else{
      view.backgroundColor = UIColor.white
    }
  }

  @IBAction func changeDatePicker(_ sender: UIDatePicker) {
    let datePickerView = sender

    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
    lbPickerTime.text =
      "선택시간: " + formatter.string(from: datePickerView.date) //선택시간에 View
    formatter.dateFormat = "hh:mm aaa"
    alarmTime = formatter.string(from: datePickerView.date)
  }


}

