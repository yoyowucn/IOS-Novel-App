//
//  TabLoadeViewController.swift
//  SavePicture
//
//  Created by Hero Super on 2019/4/17.
//  Copyright © 2019 王波. All rights reserved.
//

import UIKit
import TZImagePickerController
import ObjectMapper
class TabLoadeViewController: UIViewController {
    lazy var imgPickerVC = TZImagePickerController(maxImagesCount: 9, columnNumber: 1, delegate: self, pushPhotoPickerVc: true)
    lazy var manager = TZImageManager()
    private lazy var pickVC: UIImagePickerController = {
        let pickVC = UIImagePickerController()
        
        pickVC.allowsEditing = true
        return pickVC
    }()
    private lazy var choisevc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CHOICEVC") as! ChoiceUploadViewController
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var btn_upload: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector (showPictureAler))
        // Do any additional setup after loading the view.
        btn_upload.isUserInteractionEnabled = true
        btn_upload.addGestureRecognizer(tap)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    //上传图片选择弹框
    @objc  func showPictureAler(){
        let PictureAlert:UIAlertController = UIAlertController(title: "提示", message: "选择图片上传方式", preferredStyle: UIAlertController.Style.actionSheet)
        
        PictureAlert.addAction(UIAlertAction(title: "相册", style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
            if PermissionHelper.instance.photoEnableDelegate(){
                self.present(self.imgPickerVC!, animated: true)
            }else{
                self.showarle(title: "照片访问受限", message: "点击“设置”，允许访问您的照片")
            }
        }
    ))
        PictureAlert.addAction(UIAlertAction(title: "相机", style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
            if PermissionHelper.instance.cameraEnableDelegate(){
                self.openCamera()
            }else{
               self.showarle(title: "相机访问受限", message: "点击“设置”，允许访问您的相机")
            }
        }))
        PictureAlert.addAction(UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(PictureAlert, animated: true, completion: nil)
    }
    
    //提示框 手动设置权限
    func showarle(title:String,message:String){
        let alertController = UIAlertController(title: title,message: message,preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title:"取消", style: .cancel, handler:nil))
        alertController.addAction(UIAlertAction(title:"设置", style: .default, handler: {
            (action) -> Void in
            let url = URL(string: UIApplication.openSettingsURLString)
            if let url = url, UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url, options: [:],
                                              completionHandler: {
                                                (success) in
                    })
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }))
        self.present(alertController, animated: true, completion: nil)
        
        
    }
}
extension TabLoadeViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate,TZImagePickerControllerDelegate{
    //打开相机
    private func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            self.pickVC.delegate = self
            self.pickVC.allowsEditing = true//允许用户裁剪移动缩放
            self.pickVC.sourceType = UIImagePickerController.SourceType.camera//设置图片来源为相机
            //设置图片拾取器导航条的前景色
            self.pickVC.navigationBar.barTintColor = UIColor.orange
            //设置图片拾取器标题颜色为白色
            self.pickVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
            //设置导航条的着色颜色为白色
            self.pickVC.navigationBar.tintColor = UIColor.white
            //在当前视图控制器窗口展示图片拾取器
            self.present(self.pickVC, animated: true, completion : nil )
        }else{
            Showalert(Title : "相机不可用，您可能使用的是模拟器，请切换到真机调试")
        }
        
    }
    func imagePickerController(_ picker: TZImagePickerController!, didFinishPickingVideo coverImage: UIImage!, sourceAssets asset: PHAsset!) {
        
    }
    func imagePickerController(_ picker: TZImagePickerController!, didFinishPickingGifImage animatedImage: UIImage!, sourceAssets asset: PHAsset!) {
        
    }
    func imagePickerController(_ picker: TZImagePickerController!, didFinishPickingPhotos photos: [UIImage]!, sourceAssets assets: [Any]!, isSelectOriginalPhoto: Bool) {
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        for a in info{
              log.debug(a)
        }
      
    }
    func imagePickerController(_ picker: TZImagePickerController!, didFinishPickingPhotos photos: [UIImage]!, sourceAssets assets: [Any]!, isSelectOriginalPhoto: Bool, infos: [[AnyHashable : Any]]!) {
        for a in infos{
            Log.debug("a\(a)")
        }
        
        for j in assets{
          
        }
       
        Log.debug( assets[0])
        Log.debug( photos[0])
        for s in assets{
          
        }
//        MyMoyaManager.loadupdate(controller: self , NetworkService.saveimages(file: photos as! NSArray
//        )) { (BaseJsonBean) in
//            log.debug(BaseJsonBean)
//        }
        
    }
}

