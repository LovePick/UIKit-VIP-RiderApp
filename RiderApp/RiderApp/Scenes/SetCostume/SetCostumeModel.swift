//
//  SetCostumeModel.swift
//  RiderApp
//
//  Created by Supapon Pucknavin on 15/11/2565 BE.
//

import Foundation

enum SetCostumeModel {
    
    enum LoadCostme {
        struct Request {
            
        }
        
        struct Response {
            var costumeData: Costume
        }
    }
    
    struct ViewModel {
        let hat: [String]
        let ride: [String]
    }
}
