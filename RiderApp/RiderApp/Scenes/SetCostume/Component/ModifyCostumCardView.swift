//
//  ModifyCostumCardView.swift
//  RiderApp
//
//  Created by Supapon Pucknavin on 15/11/2565 BE.
//

import Foundation
import UIKit

class ModifyCostumCardView: UIView {
    
    let hStackView = UIStackView()
    let titleLabel = UILabel()
    let button = UIButton(primaryAction: nil)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
}

extension ModifyCostumCardView {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        hStackView.translatesAutoresizingMaskIntoConstraints = false
        hStackView.axis = .horizontal
        hStackView.spacing = 8
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        titleLabel.textColor = .black
        titleLabel.text = "titleLabel"
        
        var config = UIButton.Configuration.filled()
        config.buttonSize = .medium
        button.configuration = config
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .caption1)
        button.showsMenuAsPrimaryAction = true
        button.changesSelectionAsPrimaryAction = true
        button.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        self.addSubview(hStackView)
        hStackView.addArrangedSubview(titleLabel)
        hStackView.addArrangedSubview(button)
        
        
        NSLayoutConstraint.activate([
            hStackView.topAnchor.constraint(equalTo: self.topAnchor),
            hStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            hStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            hStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
        ])
        
        self.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        // CHCR
        button.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
        
    }
}

extension ModifyCostumCardView {
    
    func update(items:[String], selectAt:Int, handler:@escaping (UIAction)->Void) {
        
        var child: [UIAction] = [UIAction]()
        
        for i in 0..<items.count  {
            let state: UIMenuElement.State = selectAt == i ? .on : .off
            let ac = UIAction(title: items[i], state: state, handler: handler)
            child.append(ac)
        }
        
        button.menu = UIMenu(children: child)
    }
}
