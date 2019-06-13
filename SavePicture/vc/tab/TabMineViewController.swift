//
//  TabMineViewController.swift
//  SavePicture
//
//  Created by Hero Super on 2019/4/17.
//  Copyright © 2019 王波. All rights reserved.
//

import UIKit
import AVFoundation
class TabMineViewController: UIViewController{

    @IBOutlet weak var lable_code: UILabel!
    @IBAction func btn_qr(_ sender: UIButton) {
         view.layer.addSublayer(videoPreviewLayer!)
         captureSession?.startRunning()
    }
    var captureSession : AVCaptureSession?
    var videoPreviewLayer:AVCaptureVideoPreviewLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCaptureDevice()
        
        // Do any additional setup after loading the view.
    }
    
    func addCaptureDevice(){
        let captureDevice = AVCaptureDevice.default(for: .video)
        do{
            let input = try AVCaptureDeviceInput(device: captureDevice!)
            captureSession = AVCaptureSession()
            captureSession?.addInput(input)
        }catch{
            log.debug(error)
        }
        let Output = AVCaptureMetadataOutput()
        captureSession?.addOutput(Output)
        Output.setMetadataObjectsDelegate(self , queue: DispatchQueue.main)
        Output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
        videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        videoPreviewLayer?.frame = view.layer.bounds
       
       
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
extension TabMineViewController:AVCaptureMetadataOutputObjectsDelegate{
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects == nil || metadataObjects.count == 0{
            self.Showalert(Title: "扫描失败")
            return
        }
        
        let metadataobj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        if metadataobj.type == AVMetadataObject.ObjectType.qr {
            
            let barCodeobj = videoPreviewLayer?.transformedMetadataObject(for: metadataobj)
            if metadataobj.stringValue != nil{
                captureSession?.stopRunning()
                log.debug("二维码数据----   "+metadataobj.stringValue!)
                lable_code.text = "二维码数据--  "+metadataobj.stringValue!
                videoPreviewLayer?.removeFromSuperlayer()
            }
        }
    }
  
}
