//
//  ProfileView.swift
//  SkillsApp
//
//  Created by Станислав Шульц on 01.08.2023.
//

import UIKit

class ProfileView: UIView {
    
    //UI Items
    
    let parentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let scrollingCanvas: UIScrollView = {
        let view = UIScrollView()
        view.frame = view.bounds
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let grayProfileBackground: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.greyProfileBackgroundColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.titleLabelProfile
        label.font = .boldSystemFont(ofSize: Constants.titleLabelFontSize)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let avatarImage = {
        let image = UIImageView()
        image.image = UIImage(named: Constants.imageName)
        image.layer.cornerRadius = Constants.avatarCornerRadius
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.text = Constants.nameLabel
        label.font = .boldSystemFont(ofSize: Constants.nameTitleLabelFontSize)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = Constants.infoLabel
        label.font = .systemFont(ofSize: Constants.textFontSize)
        label.textColor = Constants.infoLabelTextColor
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let geoImage = {
        let image = UIImageView()
        image.image = UIImage(named: Constants.geoImage)
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let geoLabel:UILabel = {
        let label = UILabel()
        label.text = Constants.geoLabel
        label.font = .systemFont(ofSize: Constants.textFontSize)
        label.textColor = Constants.infoLabelTextColor
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let geoStack: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .center
        view.spacing = Constants.geoSpacing
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let additionalInfoStack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.spacing = Constants.additionalInfoSpacing
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let mySkill: UILabel = {
        let label = UILabel()
        label.text = Constants.titleLabelSkills
        label.font = .systemFont(ofSize: Constants.titleLabelFontSize)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let editButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "edit"), for: .normal)
        button.setImage(UIImage(named: "done"), for: .selected)
        button.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let editStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .center
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Коллекция с чипсами ->
    
    let chipsCollection = ChipsCollectionView()
    var skills = Constants.skills
    //-----------------------
    
    let aboutLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.titleLabelAbout
        label.font = .systemFont(ofSize: Constants.titleLabelFontSize)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let aboutMeText: UITextView = {
        let text = UITextView()
        text.textContainerInset = .zero
        text.text = Constants.aboutText
        text.font = .systemFont(ofSize: Constants.textFontSize)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    // Overriding initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Private configuring UI methods
    
    func configureUI() {
        backgroundColor = .white
        addSubview(scrollingCanvas)
        scrollingCanvas.addSubview(contentView)
        contentView.addSubview(grayProfileBackground)
        grayProfileBackground.addSubview(headerLabel)
        grayProfileBackground.addSubview(avatarImage)
        grayProfileBackground.addSubview(nameLabel)
        geoStack.addArrangedSubview(geoImage)
        geoStack.addArrangedSubview(geoLabel)
        additionalInfoStack.addArrangedSubview(infoLabel)
        additionalInfoStack.addArrangedSubview(geoStack)
        grayProfileBackground.addSubview(additionalInfoStack)
        editStackView.addArrangedSubview(mySkill)
        editStackView.addArrangedSubview(editButton)
        contentView.addSubview(editStackView)
        contentView.addSubview(chipsCollection)
        chipsCollection.setChipsLabelTextArray(textOfChipsArray: skills)
        contentView.addSubview(aboutLabel)
        contentView.addSubview(aboutMeText)
        setConstraints()
    }
    
    func setConstraints() {
        setScrollViewContraints()
        setContentViewConstraints()
        setGrayBackgroundConstraints()
        setHeaderLabelConsrtaints()
        setAvatarConstraints()
        setNameLabelConstraints()
        setInfoStackConstraints()
        setEditStackConstraints()
        setChipsCollectionConstraints()
        setAboutLabelConstraints()
        setAboutMeTextConstraints()
    }
    
    
    
    func setScrollViewContraints() {
        NSLayoutConstraint.activate([
            scrollingCanvas.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollingCanvas.widthAnchor.constraint(equalTo: widthAnchor),
            scrollingCanvas.centerXAnchor.constraint(equalTo: centerXAnchor),
            scrollingCanvas.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setContentViewConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollingCanvas.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollingCanvas.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollingCanvas.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollingCanvas.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollingCanvas.frameLayoutGuide.widthAnchor, multiplier: 1),
            contentView.heightAnchor.constraint(equalToConstant: 2000)
        ])
    }
    
    func setGrayBackgroundConstraints() {
        NSLayoutConstraint.activate([
            grayProfileBackground.topAnchor.constraint(equalTo: contentView.topAnchor),
            grayProfileBackground.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            grayProfileBackground.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            grayProfileBackground.heightAnchor.constraint(equalToConstant: Constants.grayBackgroundHeight)
        ])
    }
    
    func setHeaderLabelConsrtaints() {
        NSLayoutConstraint.activate([
            headerLabel.centerXAnchor.constraint(equalTo: grayProfileBackground.centerXAnchor),
            headerLabel.topAnchor.constraint(equalTo: grayProfileBackground.topAnchor),
            headerLabel.heightAnchor.constraint(equalToConstant: Constants.headerLabelHeight)
        ])
    }
    
    func setAvatarConstraints() {
        NSLayoutConstraint.activate([
            avatarImage.centerXAnchor.constraint(equalTo: grayProfileBackground.centerXAnchor),
            avatarImage.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 24),
            avatarImage.heightAnchor.constraint(equalToConstant: Constants.avatarDiametr),
            avatarImage.widthAnchor.constraint(equalToConstant: Constants.avatarDiametr)
        ])
    }
    
    func setNameLabelConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: grayProfileBackground.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: grayProfileBackground.leadingAnchor, constant: Constants.leadingOffset),
            nameLabel.trailingAnchor.constraint(equalTo: grayProfileBackground.trailingAnchor, constant: Constants.trailingOffset)
        ])
    }
    
    func setInfoStackConstraints() {
        NSLayoutConstraint.activate([
            geoImage.heightAnchor.constraint(equalToConstant: Constants.geoImageDiametr),
            geoImage.widthAnchor.constraint(equalToConstant: Constants.geoImageDiametr),
            additionalInfoStack.centerXAnchor.constraint(equalTo: grayProfileBackground.centerXAnchor),
            additionalInfoStack.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Constants.additionalInfoSpacing),
            additionalInfoStack.leadingAnchor.constraint(equalTo: grayProfileBackground.leadingAnchor, constant: Constants.leadingOffset),
            additionalInfoStack.trailingAnchor.constraint(equalTo: grayProfileBackground.trailingAnchor, constant: Constants.trailingOffset)
        ])
    }
    
    func setEditStackConstraints() {
        NSLayoutConstraint.activate([
            editButton.heightAnchor.constraint(equalToConstant: Constants.editImageDiametr),
            editButton.widthAnchor.constraint(equalToConstant: Constants.editImageDiametr),
            editStackView.centerXAnchor.constraint(equalTo: grayProfileBackground.centerXAnchor),
            editStackView.topAnchor.constraint(equalTo: grayProfileBackground.bottomAnchor, constant: Constants.editSkillSpacing),
            editStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.leadingInteval),
            editStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.trailingInteval)
        ])
    }
    
    func setChipsCollectionConstraints() {
        NSLayoutConstraint.activate([
            chipsCollection.topAnchor.constraint(equalTo: editStackView.bottomAnchor),
            chipsCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.leadingInteval),
            chipsCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.trailingInteval),
            chipsCollection.heightAnchor.constraint(equalToConstant: 500)
        ])
    }
    
    func setAboutLabelConstraints() {
        NSLayoutConstraint.activate([
            aboutLabel.topAnchor.constraint(equalTo: chipsCollection.bottomAnchor, constant: Constants.eraseButtonRightOffset),
            aboutLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.leadingInteval),
//            aboutLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.trailingInteval)
        ])
    }
    
    func setAboutMeTextConstraints() {
        NSLayoutConstraint.activate([
            aboutMeText.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: Constants.labelOffset),
            aboutMeText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.leadingInteval),
            aboutMeText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: Constants.trailingInteval),
            aboutMeText.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    @objc func editButtonTapped() {
        print("Button Edit tapped...")
    }
    
}
