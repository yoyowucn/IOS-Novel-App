//
//  BrowserImgCollectionViewCell.swift
//  SavePicture
//
//  Created by Hero Super on 2019/4/30.
//  Copyright © 2019 王波. All rights reserved.
//

import UIKit

class BrowserImgCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var txt_pagenumber: UILabel!
    @IBOutlet weak var txt_browser_imgname: UILabel!
    @IBOutlet weak var img_browser: UIImageView!
    static let reuseID =  "BrowserImgCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func updata(data : ImageData,index: Int,number:Int){
        txt_pagenumber.text = "\(index)/\(number)"
        txt_browser_imgname.text = data.imgname
        img_browser.af_setImage(withURL: URL(string: String(data.imgurl!))!)
    }
    
}
