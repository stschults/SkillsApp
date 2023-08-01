//
//  ChipsCollectionViewCell.swift
//  SkillsApp
//
//  Created by Станислав Шульц on 01.08.2023.
//

import UIKit

class ChipsCollectionViewCell: UICollectionViewCell {
    
    let chipsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        
        label.font = .systemFont(ofSize: Constants.chipsCornerRadius, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "delete"), for: .normal)
        button.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
//    override var isSelected: Bool {
//        didSet {
//            backgroundColor = self.isSelected ? Constants.selectedChipsBackgroundColor : Constants.deselectedChipsBackgroundColor
//            chipsLabel.textColor  = self.isSelected ? Constants.selectedChipsFontColor : Constants.deselectedChipsFontColor
//        }
//    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = Constants.greyProfileBackgroundColor
        layer.cornerRadius = Constants.chipsCornerRadius
        addSubview(chipsLabel)
        chipsLabel.addSubview(deleteButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate(
            [
                chipsLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                chipsLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            ]
        )
    }
    
    private func setEdittingConstraints() {
        NSLayoutConstraint.activate(
            [
                chipsLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                chipsLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
                deleteButton.heightAnchor.constraint(equalToConstant: Constants.deleteButtonSize),
                deleteButton.widthAnchor.constraint(equalToConstant: Constants.deleteButtonSize)
            ]
        )
    }
    
    @objc func deleteButtonTapped() {
        print("Delete button tapped")
    }
    
}
