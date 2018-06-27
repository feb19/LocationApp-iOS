//
//  ViewController.swift
//  LocationNotificationApp
//
//  Created by Nobuhiro Takahashi on 2018/06/23.
//  Copyright © 2018年 Nobuhiro Takahashi. All rights reserved.
//

import UIKit
import UserNotifications
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.locationManager = CLLocationManager()
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("location AuthorizationStatus:\(status)")
        if status == .authorizedAlways {
            makeLocationNotification()
        }
    }


    func makeLocationNotification() {
        let content = UNMutableNotificationContent()
        content.title = "LocationNofiticationApp"
        content.body = "1000m 以内に入ったっぽい"
        content.sound = UNNotificationSound.default()
        
        let coordinate = CLLocationCoordinate2DMake(35.5995375, 139.6096822)
        let region = CLCircularRegion.init(center: coordinate, radius: 1000.0, identifier: "Headquarter")
        region.notifyOnEntry = true
        region.notifyOnExit = false
        let trigger = UNLocationNotificationTrigger.init(region: region, repeats: false)
        
        let request = UNNotificationRequest.init(identifier: "LocationNotification", content: content, trigger: trigger)
        
        let center = UNUserNotificationCenter.current()
        center.add(request)
    }
}

