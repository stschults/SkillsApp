//
//  ChipsCollectionViewCell.swift
//  SkillsApp
//
//  Created by Станислав Шульц on 01.08.2023.
//

import UIKit

class ChipsCollectionViewCell: UICollectionViewCell {
    
    var editState: Bool = false
    
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
        button.isHidden = true
        button.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        if editState == false {
            setConstraints()
        }
        else {
            deleteButton.isHidden = false
            setEdittingConstraints()
        }
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
    
    func setConstraints() {
        NSLayoutConstraint.activate(
            [
                chipsLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                chipsLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            ]
        )
    }
    
    func setEdittingConstraints() {
        NSLayoutConstraint.activate(
            [
                chipsLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                chipsLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
                deleteButton.trailingAnchor.constraint(equalTo: chipsLabel.trailingAnchor, constant: Constants.eraseButtonRightOffset),
                deleteButton.heightAnchor.constraint(equalToConstant: Constants.deleteButtonSize),
                deleteButton.widthAnchor.constraint(equalToConstant: Constants.deleteButtonSize)
            ]
        )
    }
    
    @objc func deleteButtonTapped() {
        print("Delete button tapped")
        
    }
    
}
