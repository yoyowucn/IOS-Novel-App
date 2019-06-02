//
//  ChoiceUploadViewController.swift
//  SavePicture
//
//  Created by Hero Super on 2019/4/30.
//  Copyright © 2019 王波. All rights reserved.
//

import UIKit
import TZImagePickerController
 // MARK: - 图片选择界面
class ChoiceUploadViewController: UIViewController {
    lazy var imgPickerVC = TZImagePickerController(maxImagesCount: 9, columnNumber: 2, delegate: self, pushPhotoPickerVc: true)
    
    @IBAction func but_upload(_ sender: UIButton) {
    }
    typealias swiftblock = (_ btntag : NSArray) -> Void
    var callBack :swiftblock?
    var photolist : [UIImage] = []
    @IBOutlet weak var collectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.dataSource = self
        collectionview.delegate = self
        // Do any additional setup after loading the view.
        collectionview.register(UINib(nibName: "TabHomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier:"TabHomeCollectionViewCell")
        log.debug(imgPickerVC as Any)
        
       self.present(imgPickerVC!, animated: true, completion: nil)
    }
    func callBackBlock(
        block:@escaping swiftblock)  {
        
    }
    func imagePickerController(_ picker: TZImagePickerController!, didFinishPickingPhotos photos: [UIImage]!, sourceAssets assets: [Any]!, isSelectOriginalPhoto: Bool, infos: [[AnyHashable : Any]]!) {
        log.debug(photos! as Any)
        log.debug(infos! as Any)
        Log.info("assets", context: assets! as Any)
        photolist = photos
        collectionview.reloadData()
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
 // MARK: - UICollectionViewDelegate,UICollectionViewDataSource
extension ChoiceUploadViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photolist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabHomeCollectionViewCell", for: indexPath) as! TabHomeCollectionViewCell
        cell.img_photo.image = photolist[indexPath.item]
        return cell
    }
    
    
}
 // MARK: - UICollectionViewDelegateFlowLayout
extension ChoiceUploadViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    //设置minimumLineSpacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    //设置minimumInteritemSpacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.bounds.width-3)/3, height:(view.bounds.width/2)+40 )
    }
    
}
extension ChoiceUploadViewController: UIImagePickerControllerDelegate,TZImagePickerControllerDelegate{
    
}
