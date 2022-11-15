//
//  SetCostumeView.swift
//  RiderApp
//
//  Created by Supapon Pucknavin on 15/11/2565 BE.
//

import Foundation
import UIKit

protocol SetCostumeViewProtocol {
    var router: SetCostumeRouterProtocol? {get set}
    var interactor: SetCostumeInteractorProtocol? {get set}
    
    func update(model: SetCostumeModel.ViewModel)
    
}


class SetCostumeViewController: UIViewController, SetCostumeViewProtocol {
    
    
    

    // MARK: - COMPNENT
    let vStackView = UIStackView()
    let hatModifyCostumCardView = ModifyCostumCardView()
    let rideModifyCostumCardView = ModifyCostumCardView()
    let imageContentView = UIView()
    let imageRide = UIImageView()
    let imageMan = UIImageView()
    let imageHat = UIImageView()
    let previewButton = UIButton(type: .system)
    
    
    // MARK: - PROPERTY
    var router: SetCostumeRouterProtocol?
    var interactor: SetCostumeInteractorProtocol?
    var costumeData: SetCostumeModel.ViewModel?
    var selectHatIndex:Int = 0
    var selectRideIndex:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        interactor?.loadCostumeData(request: SetCostumeModel.LoadCostme.Request())
    }
}

extension SetCostumeViewController {
    func style() {
        title = "Rider"
        
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        vStackView.axis = .vertical
        vStackView.spacing = 0
        
        
        hatModifyCostumCardView.translatesAutoresizingMaskIntoConstraints = false
        hatModifyCostumCardView.titleLabel.text = "Hat"
        
        rideModifyCostumCardView.translatesAutoresizingMaskIntoConstraints = false
        rideModifyCostumCardView.titleLabel.text = "Ride"
        
        imageContentView.translatesAutoresizingMaskIntoConstraints = false
        
        imageRide.translatesAutoresizingMaskIntoConstraints = false
        imageRide.contentMode = .scaleAspectFit
        imageRide.image = UIImage(named: "ride1")
        
        imageMan.translatesAutoresizingMaskIntoConstraints = false
        imageMan.contentMode = .scaleAspectFit
        imageMan.image = UIImage(named: "man")
        
        imageHat.translatesAutoresizingMaskIntoConstraints = false
        imageHat.contentMode = .scaleAspectFit
        imageHat.image = UIImage(named: "hat1")
        
        previewButton.translatesAutoresizingMaskIntoConstraints = false
        previewButton.configuration = .filled()
        previewButton.setTitle("Preview", for: [])
        previewButton.addTarget(self, action: #selector(previewTapped), for: .primaryActionTriggered)
        
    }
    
    func layout() {
        
        imageContentView.addSubview(imageRide)
        imageContentView.addSubview(imageMan)
        imageContentView.addSubview(imageHat)
        
        
        view.addSubview(vStackView)
        vStackView.addArrangedSubview(hatModifyCostumCardView)
        vStackView.addArrangedSubview(rideModifyCostumCardView)
        vStackView.addArrangedSubview(imageContentView)
        vStackView.addArrangedSubview(previewButton)
        
        
        // vStackView
        NSLayoutConstraint.activate([
            vStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            vStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            vStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            vStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
        ])
        
        // imageRide
        NSLayoutConstraint.activate([
            imageRide.centerXAnchor.constraint(equalTo: imageContentView.centerXAnchor),
            imageRide.centerYAnchor.constraint(equalTo: imageContentView.centerYAnchor),
            imageRide.widthAnchor.constraint(equalTo: imageContentView.widthAnchor),
        ])
        
        // imageMan
        NSLayoutConstraint.activate([
            imageMan.centerXAnchor.constraint(equalTo: imageContentView.centerXAnchor),
            imageMan.centerYAnchor.constraint(equalTo: imageContentView.centerYAnchor),
            imageMan.widthAnchor.constraint(equalTo: imageContentView.widthAnchor),
        ])

        // imageHat
        NSLayoutConstraint.activate([
            imageHat.centerXAnchor.constraint(equalTo: imageContentView.centerXAnchor),
            imageHat.centerYAnchor.constraint(equalTo: imageContentView.centerYAnchor),
            imageHat.widthAnchor.constraint(equalTo: imageContentView.widthAnchor),
        ])

    }
}


// MARK: - SetCostumeViewProtocol
extension SetCostumeViewController {
    
    func update(model: SetCostumeModel.ViewModel) {
        print("update")
        costumeData = model
        selectHatIndex = 0
        selectRideIndex = 0
        
        hatModifyCostumCardView.update(items: model.hat, selectAt: selectHatIndex) { [weak self] action in
            print(action.title)
            guard let select = self?.costumeData?.hat.firstIndex(where: {$0 == action.title}) else { return }
            self?.selectHatIndex = select
            self?.updateImageHat(imageName: action.title)
        }
        
        
        rideModifyCostumCardView.update(items: model.ride, selectAt: selectRideIndex) { [weak self] action in
            
            guard let select = self?.costumeData?.ride.firstIndex(where: {$0 == action.title}) else { return }
            self?.selectRideIndex = select
            self?.updateImageRide(imageName: action.title)
        }
        
        
    }
}

// MARK: - ACTION
extension SetCostumeViewController {
    func updateImageHat(imageName: String) {
        imageHat.image = UIImage(named: imageName)
    }
    
    func updateImageRide(imageName: String) {
        imageRide.image = UIImage(named: imageName)
    }
    
    
    @objc func previewTapped(_ sender: UIButton){
        guard let hat = costumeData?.hat[selectHatIndex], let ride = costumeData?.ride[selectRideIndex] else { return }
        
        router?.gotoPreviewImage(hatName: hat , rideName: ride)
    }
}
