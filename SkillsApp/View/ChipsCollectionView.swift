//
//  ChipsCollectionView.swift
//  SkillsApp
//
//  Created by Станислав Шульц on 01.08.2023.
//

import UIKit

class ChipsCollectionView: UICollectionView {
    
    public var editState = false
    private let chipsColectionLayout = UICollectionViewFlowLayout()
    private var chipsNames = [String]()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: chipsColectionLayout)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        chipsColectionLayout.minimumLineSpacing = Constants.chipsMinimumLineSpaing
        chipsColectionLayout.scrollDirection = .vertical
        chipsColectionLayout.minimumInteritemSpacing = .leastNormalMagnitude
        backgroundColor = .none
        translatesAutoresizingMaskIntoConstraints = false
        bounces = false
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        delegate = self
        dataSource = self
        register(ChipsCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    func setChipsLabelTextArray(textOfChipsArray: [String]) {
        chipsNames = textOfChipsArray
    }
    
}

extension  ChipsCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        chipsNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ChipsCollectionViewCell
        else { return UICollectionViewCell() }
        cell.chipsLabel.text = chipsNames[indexPath.item]
        return cell
    }
}

extension ChipsCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item <= 5 {
            collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
        } else {
            collectionView.scrollToItem(at: indexPath, at: .right, animated: true)
        }
    }
}

extension ChipsCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let chipsFont = UIFont.systemFont(ofSize: Constants.textFontSize, weight: .regular)
        let chipsAttributes = [NSAttributedString.Key.font : chipsFont as Any]
        let chipsWidth = chipsNames[indexPath.item].size(withAttributes: chipsAttributes).width + 48
        return CGSize(width: chipsWidth,
                      height: Constants.chipsHeight)
    }
}
