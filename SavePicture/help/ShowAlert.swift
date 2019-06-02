//
//  ShowAlert.swift
//  SavePicture
//
//  Created by Hero Super on 2019/4/30.
//  Copyright © 2019 王波. All rights reserved.
//

import Foundation
import PopupDialog
class ShowAlert{
    
    
    static let instance = ShowAlert()
    private init(){
        
    }
    let LodingView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.white)
    
    func showlodingview() {
        LodingView.startAnimating()
    }
    func  dimisslodingview() {
        LodingView.stopAnimating()
        LodingView.hidesWhenStopped = true
    }
    
    
    
}
extension UIViewController{
    
    func Showalert(Title:String?)  {
        let title = "温馨提示"
        let message = Title
        let image = UIImage()
        // Create the dialog
        let popup = PopupDialog(title: title, message: message, image: image)
        // Create buttons
        let buttonOne = CancelButton(title: "确定") {
            print("确定")
        }
        
        // Add buttons to dialog
        // Alternatively, you can use popup.addButton(buttonOne)
        // to add a single button
        popup.addButtons([buttonOne])
        
        // Present dialog
        self.present(popup, animated: true, completion: nil)
    }
    
    func ShowTipsClose(tite:String?)  {
        let TipsActionSheet : UIAlertController = UIAlertController(title: tite, message: nil, preferredStyle: UIAlertController.Style.alert)
        //        TipsActionSheet.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        //        TipsActionSheet.addAction(UIAlertAction(title: "确认", style: .destructive, handler: { (UIAlertAction) in
        //            self.navigationController?.popViewController(animated: true)
        //        }))
        self.present(TipsActionSheet, animated: true, completion: nil)
        Taolsterhelper.instance.delay(by: 1) {
            TipsActionSheet.dismiss(animated: true, completion: nil)
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
    func ShowTip(Title:String?){
        let TipsActionSheet : UIAlertController = UIAlertController(title: Title, message: nil, preferredStyle: UIAlertController.Style.alert)
        self.present(TipsActionSheet, animated: true, completion: nil)
        Taolsterhelper.instance.delay(by: 1) {
            TipsActionSheet.dismiss(animated: true, completion: nil)
            
        }
    }
    
}



extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}
