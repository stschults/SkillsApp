//
//  Constants.swift
//  SkillsApp
//
//  Created by Станислав Шульц on 01.08.2023.
//

import UIKit

/// Imatates fetched data via hardcoded enumeration
enum Constants{
    static var skills: [String] = ["Swift","GCD","Moya","MVC", "ООП", "Autolayot", "Storyboard", "SwiftUI"]
    static let greyProfileBackgroundColor: UIColor = UIColor(red: 243/255,
                                                             green: 243/255,
                                                             blue: 245/255,
                                                             alpha: 1)
    static let infoLabelTextColor: UIColor = UIColor(red: 150/255,
                                                     green: 149/255,
                                                     blue: 155/255,
                                                     alpha: 1)
    static let titleLabelProfile: String = "Профиль"
    static let titleLabelSkills: String = "Мои навыки"
    static let titleLabelAbout: String = "О себе"
    static let nameLabel: String = "Шульц Станислав Леонидович"
    static let infoLabel: String = "iOS разработчик, опыт более 1-го года"
    static let geoLabel: String = "Москва"
    static let headerLabelHeight: CGFloat = 56.0
    static let standardItemHeight: CGFloat = 50.0
    static let elementInterval: CGFloat = 20.0
    static let leadingInteval: CGFloat = 16.0
    static let trailingInteval: CGFloat = -16.0
    static let leadingOffset: CGFloat = 50.0
    static let trailingOffset: CGFloat = -50.0
    static let grayBackgroundHeight: CGFloat = 387.0
    static let avatarDiametr: CGFloat = 120.0
    static let geoImageDiametr: CGFloat = 16.0
    static let editImageDiametr: CGFloat = 24.0
    static let chipsCornerRadius: CGFloat = 12.0
    static let avatarCornerRadius: CGFloat = 60.0
    static let nameTitleLabelFontSize: CGFloat = 24.0
    static let titleLabelFontSize: CGFloat = 16.0
    static let textFontSize: CGFloat = 14.0
    static let editSkillSpacing: CGFloat = 21.0
    static let geoSpacing: CGFloat = 2.0
    static let additionalInfoSpacing: CGFloat = 4.0
    static let eraseButtonRightOffset: CGFloat = 24.0
    static let deleteButtonSize: CGFloat = 12.0
    static let labelOffset: CGFloat = 8.0
    static let chipsHeight: CGFloat = 44.0
    static let aboutText: String = "Hello, my name is Stanislav Schults. I am a iOS engineer and I can help you to create your own mobile application or give you some advices. Contact me on telegram or e-mail. You can get more information about me on interview. See you and have a nice day 😊"
    static let imageName: String = "myAvatar"
    static let geoImage: String = "geo"
    static let chipsMinimumLineSpaing: CGFloat = 12.0
    static let emptyString: String = ""
}
