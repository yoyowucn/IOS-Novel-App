//
//  BootPageViewController.swift
//  SavePicture
//
//  Created by Hero Super on 2019/5/21.
//  Copyright © 2019 王波. All rights reserved.
//

import UIKit

class BootPageViewController: UIViewController {
    let mainvc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MAIN_VC") as! MainViewController
    let logvc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LOGINVC") as! LoginViewController
    @IBOutlet weak var bankimg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let token = KeychainManager.keyChainReadData(identifier: "Token") as? String
        
        if token?.isEmpty == false {
            
            Taolsterhelper.instance.delay(by: 1) {
                UIView.animate(withDuration: 2, animations:{ self.bankimg.frame = CGRect(x: -20, y: -20, width: UIScreen.main.bounds.width+30, height: UIScreen.main.bounds.height+30)}, completion: { (true) in
                    let tranststion =  CATransition()
                    tranststion.duration = 1
                    tranststion.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
                    UIApplication.shared.keyWindow?.layer.add(tranststion, forKey: "animation")
                    UIApplication.shared.keyWindow?.rootViewController = self.mainvc
                    
                })
            }
        }else{
            Taolsterhelper.instance.delay(by: 1) {
                UIView.animate(withDuration: 2, animations:{ self.bankimg.frame = CGRect(x: -20, y: -20, width: UIScreen.main.bounds.width+30, height: UIScreen.main.bounds.height+30)}, completion: { (true) in
                    let tranststion =  CATransition()
                    tranststion.duration = 1
                    tranststion.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
                    UIApplication.shared.keyWindow?.layer.add(tranststion, forKey: "animation")
                    UIApplication.shared.keyWindow?.rootViewController = self.logvc
                    
                })
            }
        }
        
       
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
