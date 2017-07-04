//
//  ViewController.swift
//  TouchID
//
//  Created by PATRICK MARSHALL on 7/4/17.
//  Copyright © 2017 patrickmarshall. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBAction func buttonPressed(_ sender: Any) {
        let context:LAContext = LAContext()
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil){
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Input you fingerprint", reply: { (success, error) in
                if success{
                    let successVC = self.storyboard?.instantiateViewController(withIdentifier: "successVC") as! UIViewController
                    self.navigationController?.pushViewController(successVC, animated: true)
                    print ("LOGGED IN")
                }
                else{
                    let failVC = self.storyboard?.instantiateViewController(withIdentifier: "failVC") as! UIViewController
                    self.navigationController?.pushViewController(failVC, animated: true)
                    print("You're not allowed")
                }
            })
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

