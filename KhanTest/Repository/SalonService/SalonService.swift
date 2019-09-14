//
//  RateRemoteDataSource.swift
//  KhanTest
//
//  Created by Daulet on 21/05/2019.
//  Copyright © 2019 daukabase. All rights reserved.
//

import Foundation
import Alamofire

enum SalonsType: String {
    case popular = "getPopular"
    case recommended = "getRecommended"
    case recent = "getRecentlyAdded"
}

class SalonService: SalonAbstractService {
    
    // TODO: ask for pagination
    
    func fetchSalons(for type: SalonsType, onSuccess: @escaping ([SalonInfo]) -> Void) {
        guard let url = URL(string: type.rawValue, relativeTo: URLs.salon) else {
            return
        }
        request(url).validate().responseJSON { (response) in
            switch response.result {
            case .success(let value):
                guard let data = (value as? [String: Any])?["salons"] else {
                    return
                }
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
                    let salons = try JSONDecoder().decode([SalonInfo].self, from: jsonData)
                    onSuccess(salons)
                } catch {
                    // TODO: handle error
                }
            case .failure(let error):
                // TODO: handle error
                print(error.localizedDescription)
                break
            }
        }
    }
    
    func fetchSalon(with id: String, onSuccess: @escaping (SalonDetailedInfo) -> Void) {
        guard
            let url = URL(string: "page?id=\(id)", relativeTo: URLs.salon)
        else {
            return
        }
        
        request(url).validate().responseJSON { (response) in
            switch response.result {
            case .success(let value):
                guard let data = (value as? [String: Any])?["salon"] else {
                    return
                }
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
                    
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .formatted(.ddMMYYYYHHmm)
                    let salon = try decoder.decode(SalonDetailedInfo.self, from: jsonData)
                    onSuccess(salon)
                } catch {
                    // TODO: handle error
                }
            case .failure:
                // TODO: handle error
                break
            }
        }
        
    }
    
}
