//
//  TabHomeViewController.swift
//  SavePicture
//
//  Created by Hero Super on 2019/4/17.
//  Copyright © 2019 王波. All rights reserved.
//

import UIKit
import AlamofireImage
import MJRefresh
import SKPhotoBrowser
 // MARK: - 首页
//首页
class TabHomeViewController: UIViewController {
    let header = MJRefreshNormalHeader()
    let footer = MJRefreshAutoFooter()
    var typelist :[NovelType] = []
    var novellist :[Novel] = []
    var page = 0
    let loginvc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LOGINVC") as! LoginViewController
    
//    lazy var browserVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BROWSEVC") as! BrowseImgViewController
    @IBOutlet weak var noveltableview: UITableView!
    @IBOutlet weak var classtableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        classtableview.delegate = self
        classtableview.dataSource = self
        noveltableview.dataSource = self
        noveltableview.delegate = self
         self.classtableview.separatorStyle = .none
        self.noveltableview.separatorStyle = .none
        
        if UserInfoHelper.instance.getusertoken().isEmpty{
            self.navigationController?.pushViewController(loginvc, animated: true)
        }
         noveltableview.register(UINib(nibName: "TabHomeNovelTableViewCell", bundle: nil), forCellReuseIdentifier: "TabHomeNovelTableViewCell")
        MyMoyaManager.getnoveltypelist(controller: self, NetworkService.allnoveltype) { (NovelTypeBean) in
            self.typelist = NovelTypeBean!.data!
            log.info(NovelTypeBean?.data)
            self.classtableview.reloadData()
            self.classtableview.selectRow(at: IndexPath.init(item: 0, section: 0), animated: true, scrollPosition: .none)
        }
        
    }
    func getTypeNovel(Type:Int,refresh:Bool){
        MyMoyaManager.getnovellist(controller: self, NetworkService.typepagenovel(page: page, size: 10, type: Type)) { (NovelBean) in
           
            if refresh{
//                 self.novellist = []
                 self.novellist = NovelBean!.data!
                 self.noveltableview.reloadData()
            }else{
                for (index,item) in (NovelBean?.data?.enumerated())!{
                  self.novellist.append(item)
                  self.noveltableview.reloadData()
                }
//                self.novellist.append(contentsOf: NovelBean?.data?.enumerated())
            }
           
        }
    }
}
extension TabHomeViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == classtableview{
             return typelist.count
        }else{
            return novellist.count
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView==classtableview {
           getTypeNovel(Type: typelist[indexPath.item].id!,refresh: true)
        }else{
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == classtableview{
            let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath) as! UITableViewCell
            cell.textLabel?.text = typelist[indexPath.item].typename
            cell.selectionStyle = .none
            cell.textLabel?.numberOfLines = 10
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TabHomeNovelTableViewCell", for: indexPath) as!TabHomeNovelTableViewCell
            cell.updatacell(novel: novellist[indexPath.item])
            
            return cell
        }
    }
}


