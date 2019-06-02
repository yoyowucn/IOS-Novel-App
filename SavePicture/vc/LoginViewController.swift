//
//  LoginViewController.swift
//  SavePicture
//
//  Created by Hero Super on 2019/5/23.
//  Copyright © 2019 王波. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var phone:String = ""
    var password:String = ""
    
    @IBAction func btn_login(_ sender: UIButton) {
        if TextUntils.instance.isPhoneNumber(phoneNumber: phone){
        }else{
            ShowTip(Title: "手机号不正确请重新填写")
            return
        }
        if TextUntils.instance.isPasswordRuler(password: password){
            
        }else{
            ShowTip(Title: "请填写大于6位字母和数字组合的密码")
        }
        MyMoyaManager.novellogin(controller: self, NetworkService.Login(phone: phone, password: password)) { (User) in
            if let a = User{
                let sd = KeychainManager.keyChainSaveData(data: a.data?.token!, withIdentifier: "Token")
                if sd {
                    log.debug("保存token成功")
                    let manvc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MAIN_VC") as! MainViewController
                     UIApplication.shared.keyWindow?.rootViewController = manvc
                }
            }
        }
        
    }
    @IBOutlet weak var lable_password: UITextField!
    @IBOutlet weak var lable_phone: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        lable_phone.delegate = self
        lable_password.delegate = self
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
extension LoginViewController:UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case lable_phone:
            phone = lable_phone.text!
        case lable_password:
            password = lable_password.text!
        default:
            log.debug("nothing")
        }
    }
}
