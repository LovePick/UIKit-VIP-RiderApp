//
//  SetCostumePresenter.swift
//  RiderApp
//
//  Created by Supapon Pucknavin on 15/11/2565 BE.
//

import Foundation

protocol SetCostumePresenterProtocol  {
    var view: SetCostumeViewProtocol? {get set}
    
    func presentCostumeData(reponse: SetCostumeModel.LoadCostme.Response)
}

class SetCostumePresenter: SetCostumePresenterProtocol {
    var view: SetCostumeViewProtocol?
    
    func presentCostumeData(reponse: SetCostumeModel.LoadCostme.Response) {
        print("presentCostumeData")
        let viewModel = SetCostumeModel.ViewModel(
            hat: reponse.costumeData.hat,
            ride: reponse.costumeData.rides
        )
        
        view?.update(model: viewModel)
    }
    
    
}
