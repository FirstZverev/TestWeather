//
//  NavigationBar.swift
//  TestWeather
//
//  Created by Володя Зверев on 01.03.2021.
//

import UIKit

func navigationCusmotizing(nav: UINavigationController, navItem: UINavigationItem, title: String?) {
    let backButton = BackBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    navItem.backBarButtonItem = backButton
    nav.navigationBar.backItem?.title = ""
    navItem.backBarButtonItem?.title = ""
    nav.navigationBar.isHidden = false
    nav.navigationBar.isTranslucent = false
    nav.navigationBar.barTintColor  = .systemGray6
    nav.navigationBar.backgroundColor = .systemGray6
    nav.view.backgroundColor = .systemGray3
    let title = title ?? ""
    navItem.title = "\(title)"
    let textAttributes = [NSAttributedString.Key.font: UIFont(name: "Avenir-Medium", size: 20)!]
    navItem.leftItemsSupplementBackButton = true
    nav.navigationBar.titleTextAttributes = textAttributes
    nav.navigationBar.layer.shadowColor = UIColor.black.cgColor
    nav.navigationBar.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
    nav.navigationBar.layer.shadowRadius = 3.0
    nav.navigationBar.layer.shadowOpacity = 0.2
    if #available(iOS 14.0, *) {
        navItem.backBarButtonItem?.menu = nil
    }
}
class BackBarButtonItem: UIBarButtonItem {
  @available(iOS 14.0, *)
  override var menu: UIMenu? {
    set {

    }
    get {
      return super.menu
    }
  }
}
