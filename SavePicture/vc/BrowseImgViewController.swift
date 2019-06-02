//
//  BrowseImgViewController.swift
//  SavePicture
//
//  Created by Hero Super on 2019/4/30.
//  Copyright © 2019 王波. All rights reserved.
//

import UIKit

class BrowseImgViewController: UIViewController {
    var data : [ImageData] = []
    var index : Int = 0
    @IBOutlet weak var colloctionview: UICollectionView!
    @IBAction func but_finsh(_ sender: Any) {
       self.navigationController?.popViewController(animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        colloctionview.dataSource = self
        colloctionview.delegate = self
        colloctionview.register(UINib(nibName: "BrowserImgCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BrowserImgCollectionViewCell")
        log.debug("页数"+String(index))
        colloctionview.isPagingEnabled = true
    }
    

    override func viewDidAppear(_ animated: Bool) {
        log.debug("viewDidAppear")
        log.debug("宽\(self.view.bounds.width)")
        log.debug("高\(self.view.bounds.height)")
        self.colloctionview.scrollToItem(at: IndexPath(item: index, section: 0), at: .bottom, animated: false)
    }
  

}
extension BrowseImgViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = colloctionview.dequeueReusableCell(withReuseIdentifier: "BrowserImgCollectionViewCell", for: indexPath) as!
BrowserImgCollectionViewCell
        cell.updata(data: data[indexPath.item], index: indexPath.item, number: data.count)
//        cell.img_browser.af_setImage(withURL: URL(string: data[indexPath.item].imgurl!+"?x-oss-process=style/Originalgraph")!)
//        cell.txt_pagenumber.text = String(indexPath.item+1)+"/"+String(data.count)
//        cell.txt_browser_imgname.text = data[indexPath.item].imgname
        return cell
    }
    
    
}

extension BrowseImgViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        Log.debug("view.bounds.width\(view.bounds.width)","view.bounds.height\(view.bounds.height)")
        return CGSize(width: view.bounds.width, height:view.bounds.height )
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    //设置minimumLineSpacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    //设置minimumInteritemSpacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 0, height: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: 0, height: 0)
    }
}
