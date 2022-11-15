//
//  PreviewView.swift
//  RiderApp
//
//  Created by Supapon Pucknavin on 15/11/2565 BE.
//

import Foundation
import UIKit



class PreviewViewController: UIViewController {
    
    // MARK: - COMPONENT
    let imageContentView = UIView()
    let imageRide = UIImageView()
    let imageMan = UIImageView()
    let imageHat = UIImageView()
    
    // MARK: - PROPERTY
    var viewModel: PreviewModel.viewModel
    
    init(viewModel: PreviewModel.viewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension PreviewViewController {
    func style() {
        view.backgroundColor = .white
        
        imageContentView.translatesAutoresizingMaskIntoConstraints = false
        
        imageRide.translatesAutoresizingMaskIntoConstraints = false
        imageRide.contentMode = .scaleAspectFit
        imageRide.image = UIImage(named: viewModel.rideImageName)
        
        imageMan.translatesAutoresizingMaskIntoConstraints = false
        imageMan.contentMode = .scaleAspectFit
        imageMan.image = UIImage(named: "man")
        
        imageHat.translatesAutoresizingMaskIntoConstraints = false
        imageHat.contentMode = .scaleAspectFit
        imageHat.image = UIImage(named: viewModel.hatImageName)
    }
    
    func layout() {
        imageContentView.addSubview(imageRide)
        imageContentView.addSubview(imageMan)
        imageContentView.addSubview(imageHat)
        
        view.addSubview(imageContentView)
        
        //imageContentView
        NSLayoutConstraint.activate([
            imageContentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageContentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            imageContentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            imageContentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
        
        // imageRide
        NSLayoutConstraint.activate([
            imageRide.topAnchor.constraint(equalTo: imageContentView.topAnchor),
            imageRide.bottomAnchor.constraint(equalTo: imageContentView.bottomAnchor),
            imageRide.leadingAnchor.constraint(equalTo: imageContentView.leadingAnchor),
            imageRide.trailingAnchor.constraint(equalTo: imageContentView.trailingAnchor),
        ])
        
        // imageMan
        NSLayoutConstraint.activate([
            imageMan.topAnchor.constraint(equalTo: imageContentView.topAnchor),
            imageMan.bottomAnchor.constraint(equalTo: imageContentView.bottomAnchor),
            imageMan.leadingAnchor.constraint(equalTo: imageContentView.leadingAnchor),
            imageMan.trailingAnchor.constraint(equalTo: imageContentView.trailingAnchor),
        ])
        
        // imageHat
        NSLayoutConstraint.activate([
            imageHat.topAnchor.constraint(equalTo: imageContentView.topAnchor),
            imageHat.bottomAnchor.constraint(equalTo: imageContentView.bottomAnchor),
            imageHat.leadingAnchor.constraint(equalTo: imageContentView.leadingAnchor),
            imageHat.trailingAnchor.constraint(equalTo: imageContentView.trailingAnchor),
        ])
    }
}



