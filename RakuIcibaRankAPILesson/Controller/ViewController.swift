//
//  ViewController.swift
//  RakuIcibaRankAPILesson
//
//  Created by UrataHiroki on 2021/11/13.
//

import UIKit

class ViewController: UIViewController {

 
    @IBOutlet weak var selectGenderSegment: UISegmentedControl!
    @IBOutlet weak var selectAgeSegment: UISegmentedControl!
    @IBOutlet weak var resultTableView: UITableView!
    
    private var cellContentsArray = [ItemDetailDatas]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultTableView.register(UINib(nibName: "ResultTableViewCell", bundle: nil), forCellReuseIdentifier: "ResultDetailCell")
        resultTableView.delegate = self
        resultTableView.dataSource = self
        
    }


    @IBAction func search(_ sender: UIButton) {
        
        
    }
}

extension ViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return tableView.frame.height / 2.3
    }
}

extension ViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cellContentsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
