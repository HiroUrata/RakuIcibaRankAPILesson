//
//  ViewController.swift
//  RakuIcibaRankAPILesson
//
//  Created by UrataHiroki on 2021/11/13.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

 
    @IBOutlet weak var selectGenderSegment: UISegmentedControl!
    @IBOutlet weak var selectAgeSegment: UISegmentedControl!
    @IBOutlet weak var resultTableView: UITableView!
    
    private let alamofireProcess = AlamofireProcess()
    
    private var cellContentsArray = [ItemDetailDatas]()
    
    private let genderContents = [1,0]
    private let ageContents = [10,20,30,40,50]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultTableView.register(UINib(nibName: "ResultTableViewCell", bundle: nil), forCellReuseIdentifier: "ResultDetailCell")
        resultTableView.delegate = self
        resultTableView.dataSource = self
        
    }


    @IBAction func search(_ sender: UIButton) {
        
        alamofireProcess.getItemDetailData(targetGender: genderContents[selectGenderSegment.selectedSegmentIndex], targetAge: ageContents[selectAgeSegment.selectedSegmentIndex]) { result, error in
        
            if error != nil{
                
                return
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {[self] in
                
                cellContentsArray = result!
                resultTableView.reloadData()
            }
        }
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultDetailCell", for: indexPath) as! ResultTableViewCell
        
        cell.rankLabel.text = String(cellContentsArray[indexPath.row].rank!) + "位"
        cell.mediumImageView.sd_setImage(with: URL(string: cellContentsArray[indexPath.row].mediumImageURL!), completed: nil)
        cell.itemNameLabel.text = cellContentsArray[indexPath.row].itemName
        cell.itemPriceLabel.text = cellContentsArray[indexPath.row].itemPrice
        
        return cell
    }
}
