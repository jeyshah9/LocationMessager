//
//  ViewController.swift
//  LocationMessager
//
//  Created by Jay Shah on 4/7/18.
//  Copyright © 2018 Jay Shah. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController , MFMessageComposeViewControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func SendBtnClicked(_ sender: UIButton) {
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self
        
        // Configure the fields of the interface.
        composeVC.recipients = ["XXXXXXXX"]
        composeVC.body = "Reached";
        
        if !MFMessageComposeViewController.canSendText() {
            print("SMS services are not available")
        }
        
        if(sender.tag==0){
            print("Reached");
            composeVC.body = "Reached 😘 .. Have a nice day 😘";
        }else if (sender.tag==1){
            print("leaving");
            composeVC.body = "Leaving now 😉 ... See you soon";
        }
        
        // Present the view controller modally.
        self.present(composeVC, animated: true, completion: nil)
        
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController,
                                      didFinishWith result: MessageComposeResult) {
        
        controller.dismiss(animated: true, completion: nil)
        
    }
    
   
    
}

