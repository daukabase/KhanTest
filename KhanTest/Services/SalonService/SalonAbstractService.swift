//
//  SalonAbstractService.swift
//  KhanTest
//
//  Created by Daulet on 14/09/2019.
//  Copyright © 2019 daukabase. All rights reserved.
//

import Foundation

protocol SalonAbstractService {
    // TODO: hadnle errors
    func fetchSalons(for type: SalonsType, onSuccess: @escaping ([SalonInfo]) -> Void)
    func fetchSalon(with id: String, onSuccess: @escaping (SalonDetailedInfo) -> Void)
}
