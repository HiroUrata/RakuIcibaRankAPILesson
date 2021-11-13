//
//  AlamofireProcess.swift
//  RakuIcibaRankAPILesson
//
//  Created by UrataHiroki on 2021/11/13.
//

import Alamofire
import SwiftyJSON
import UIKit

class AlamofireProcess{
    
    private var itemDetailResultArray = [ItemDetailDatas]()
}

extension AlamofireProcess{
    
    public func getItemDetailData(targetGender:Int?,targetAge:Int?,completion:@escaping ([ItemDetailDatas]?,Error?) -> Void){
        
        guard let gender = targetGender else { return }
        guard let age = targetAge else { return }
        
        let apiKey = ""
        
        AF.request(apiKey, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON {[self] response in
            
            switch response.result{
                
            case .success:
                
                let detailData = JSON(response.data as Any)
                print(detailData)
                for dataCount in 0..<detailData["Items"].count{
                    
                    
                    if let getRank = detailData["Items"][dataCount]["Item"]["rank"].int,
                       let getmediumImageUrl = detailData["Items"][dataCount]["Item"]["mediumImageUrls"][0]["imageUrl"].string,
                       let getItemName = detailData["Items"][dataCount]["Item"]["itemName"].string,
                       let getItemPrice = detailData["Items"][dataCount]["Item"]["itemPrice"].string{
                        
                        itemDetailResultArray.append(ItemDetailDatas(rank: getRank,
                                                                     mediumImageURL: getmediumImageUrl,
                                                                     itemName: getItemName,
                                                                     itemPrice: getItemPrice))
                        
                    }
                }
                print(itemDetailResultArray)
                completion(itemDetailResultArray, nil)
                
            case .failure(let error):
                
                completion(nil, error)
            }
        }
    }
    
}


//extension String{
//
//    var urlEncoded:String{
//
//        let charset = CharacterSet.alphanumerics.union(.init(charactersIn: "/?-._~"))
//        let remove = removingPercentEncoding ?? self
//
//        return remove.addingPercentEncoding(withAllowedCharacters: charset) ?? remove
//    }
//}
