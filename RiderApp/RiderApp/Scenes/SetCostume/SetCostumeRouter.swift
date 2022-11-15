//
//  SetCostumeRouter.swift
//  RiderApp
//
//  Created by Supapon Pucknavin on 15/11/2565 BE.
//

import Foundation

protocol SetCostumeRouterProtocol {
    var entry: SetCostumeViewController? {get}
    
    static func createSetCostumeScene() -> SetCostumeRouterProtocol
    
    func gotoPreviewImage(hatName:String, rideName:String)
}

class SetCostumeRouter: SetCostumeRouterProtocol {
    var entry: SetCostumeViewController?
    
    static func createSetCostumeScene() -> SetCostumeRouterProtocol {
        let router = SetCostumeRouter()
        let view = SetCostumeViewController()
        let presenter = SetCostumePresenter()
        let interactor = SetCostumeInteractor()
        
        router.entry = view
        
        view.interactor = interactor
        view.router = router
        
        interactor.presenter = presenter
        
        presenter.view = view
        
        return router
    }
    
    func gotoPreviewImage(hatName: String, rideName: String) {
        print("gotoPreviewImage")
        
        let model = PreviewModel.viewModel(hatImageName: hatName, rideImageName: rideName)
        let vc = PreviewViewController(viewModel: model)
        self.entry?.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
