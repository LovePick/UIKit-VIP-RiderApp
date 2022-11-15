//
//  SetCostumeInteractor.swift
//  RiderApp
//
//  Created by Supapon Pucknavin on 15/11/2565 BE.
//

import Foundation

protocol SetCostumeInteractorProtocol {
    var presenter: SetCostumePresenterProtocol? {get set}
    
    func loadCostumeData(request: SetCostumeModel.LoadCostme.Request)
}

class SetCostumeInteractor : SetCostumeInteractorProtocol {
    var presenter: SetCostumePresenterProtocol?
    
    func loadCostumeData(request: SetCostumeModel.LoadCostme.Request) {
        print("loadCostumeData")
        let costumeData: Costume = Bundle.main.decode("costume.json")
        let response = SetCostumeModel.LoadCostme.Response(costumeData: costumeData)
        presenter?.presentCostumeData(reponse: response)
        
    }
    
    
}
