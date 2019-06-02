//
//  TabSeeViewController.swift
//  SavePicture
//
//  Created by Hero Super on 2019/4/17.
//  Copyright © 2019 王波. All rights reserved.
//

import UIKit

class TabSeeViewController: UIViewController {
    let data = ["h小明","小白","小刷","圣诞节啊是"]
    var mysearchvc = UISearchController()
    let searchbar : UISearchBar = UISearchBar()
    override func viewDidLoad() {
        super.viewDidLoad()
//        searchbar.delegate = self
       
        mysearchvc = UISearchController(searchResultsController: nil)
        mysearchvc.searchResultsUpdater = self
        mysearchvc.delegate = self
         self.navigationItem.searchController = mysearchvc
        
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
extension TabSeeViewController:UISearchBarDelegate,UISearchControllerDelegate,UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    
}

