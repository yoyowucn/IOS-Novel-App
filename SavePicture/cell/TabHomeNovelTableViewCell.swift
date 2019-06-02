//
//  TabHomeNovelTableViewCell.swift
//  SavePicture
//
//  Created by Hero Super on 2019/5/22.
//  Copyright © 2019 王波. All rights reserved.
//

import UIKit

class TabHomeNovelTableViewCell: UITableViewCell {
    static let reuseID =  "TabHomeNovelTableViewCell"
    
    @IBOutlet weak var novelimg: UIImageView!
    
    @IBOutlet weak var novel_author: UILabel!
    
    @IBOutlet weak var novel_name: UILabel!
    @IBOutlet weak var novel_easyinfo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updatacell(novel:Novel){
        if let  s = novel.novel_img?.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "，", with: "").replacingOccurrences(of: "", with: "").replacingOccurrences(of: "：", with: "").replacingOccurrences(of: "！", with: "").replacingOccurrences(of: "\n", with: "") {
            novelimg.af_setImage(withURL: URL(string: s) ?? URL(string: "http.bai.com")!)
        }else{
            novelimg.image = #imageLiteral(resourceName: "IMG_4427")
        }
        novel_name.text = novel.novel_name!
        novel_author.text = novel.novel_author!
        novel_easyinfo.text = String.init(novel.novel_easyinfo!)
    }
}
