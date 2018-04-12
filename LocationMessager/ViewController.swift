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
        
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        
        if(hour>14){
            createMessage(body:"Leaving now 😉 ... See you soon");
        }else{
            createMessage(body:"Reached 😘 .. Have a nice day 😘");
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func SendBtnClicked(_ sender: UIButton) {
        
        if(sender.tag==0){
            print("Reached");
           createMessage(body:"Reached 😘 .. Have a nice day 😘");
        }else if (sender.tag==1){
            print("leaving");
            createMessage(body:"Leaving now 😉 ... See you soon");
        }
        
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController,
                                      didFinishWith result: MessageComposeResult) {
        
        controller.dismiss(animated: true, completion: nil)
        
    }
    
    func createMessage(body:String) -> Void {
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self
        
        // Configure the fields of the interface.
        composeVC.recipients = ["XXXXXXX"]
        composeVC.body = body;
        
        // Present the view controller modally.
        self.present(composeVC, animated: true, completion: nil)
        
    }
   
    
}

