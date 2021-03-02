//
//  WeatherCell.swift
//  TestWeather
//
//  Created by Володя Зверев on 01.03.2021.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    var content: UIView!
    var city: UILabel!
    var temprature: UILabel!
    var state: UILabel!


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }
    
    func initialize() {
        
        let content = UIView()
        content.backgroundColor = .systemGray6
        content.translatesAutoresizingMaskIntoConstraints = false
        content.layer.shadowColor = UIColor.black.cgColor
        content.layer.shadowRadius = 3.0
        content.layer.shadowOpacity = 0.1
        content.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        content.layer.cornerRadius = 10
        self.contentView.addSubview(content)
        self.content = content
        
        let city = UILabel()
        city.font = UIFont(name:"Avenir-Light", size: 20)
        city.textAlignment = .center
        city.translatesAutoresizingMaskIntoConstraints = false
        city.numberOfLines = 0
        self.content.addSubview(city)
        self.city = city
        
        let temprature = UILabel()
        temprature.font = UIFont(name:"Avenir-Medium", size: 60)
        temprature.textAlignment = .left
        temprature.translatesAutoresizingMaskIntoConstraints = false
        temprature.numberOfLines = 0
        self.content.addSubview(temprature)
        self.temprature = temprature
        
        let state = UILabel()
        state.font = UIFont(name:"Avenir-Light", size: 20)
        state.textAlignment = .center
        state.translatesAutoresizingMaskIntoConstraints = false
        state.numberOfLines = 0
        self.content.addSubview(state)
        self.state = state

        
        NSLayoutConstraint.activate([
            self.content!.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            self.content!.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            self.content!.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            self.content!.bottomAnchor.constraint(equalTo: self.state!.bottomAnchor, constant: 20),


            self.city!.leadingAnchor.constraint(equalTo: self.content!.leadingAnchor, constant: 20),
            self.city!.topAnchor.constraint(equalTo: self.content!.topAnchor, constant: 20),
            self.city!.trailingAnchor.constraint(equalTo: self.content!.trailingAnchor, constant: -20),

            self.temprature!.leadingAnchor.constraint(equalTo: self.content!.leadingAnchor, constant: 30),
            self.temprature!.topAnchor.constraint(equalTo: self.city!.bottomAnchor, constant: 20),

            self.state!.leadingAnchor.constraint(equalTo: self.temprature!.trailingAnchor, constant: 20),
            self.state!.centerYAnchor.constraint(equalTo: self.temprature!.centerYAnchor),
            self.state!.trailingAnchor.constraint(equalTo: self.content!.trailingAnchor, constant: -20),
            self.state!.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

    }
}
