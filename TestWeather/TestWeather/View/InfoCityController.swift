//
//  InfoCityController.swift
//  TestWeather
//
//  Created by Володя Зверев on 02.03.2021.
//

import UIKit

class InfoCityController: UIViewController {
    
    var yandexModel: YandexModel?
    
    var nameCityLabel: UILabel = {
        let nameCityLabel = UILabel()
        nameCityLabel.font = UIFont(name:"Avenir-Light", size: 50)
        nameCityLabel.textAlignment = .center
        nameCityLabel.translatesAutoresizingMaskIntoConstraints = false
        nameCityLabel.numberOfLines = 0
        return nameCityLabel
    }()
    var tempCityLabel: UILabel = {
        let tempCityLabel = UILabel()
        tempCityLabel.font = UIFont(name:"Avenir-Light", size: 20)
        tempCityLabel.textAlignment = .left
        tempCityLabel.translatesAutoresizingMaskIntoConstraints = false
        tempCityLabel.numberOfLines = 0
        return tempCityLabel
    }()

    override func viewWillAppear(_ animated: Bool) {
        nameCityLabel.text = yandexModel?.geoObject?.locality?.name
        guard let temp = yandexModel?.fact?.temp,
                let tempMin = yandexModel?.forecasts?.first?.parts?.day?.tempMin,
                let tempMax = yandexModel?.forecasts?.first?.parts?.day?.tempMax else {return}
        tempCityLabel.text = "Акутальная температура: \(temp) \n" + "Температура на завтра от \(tempMin) до \(tempMax)"


    }
    
    override func viewDidLoad() {
        view.backgroundColor = .systemGray6
        constraints()
    }

    fileprivate func constraints() {
        view.addSubview(nameCityLabel)
        view.addSubview(tempCityLabel)

        NSLayoutConstraint.activate([
            
            self.nameCityLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            self.nameCityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            self.nameCityLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            self.tempCityLabel.topAnchor.constraint(equalTo: nameCityLabel.bottomAnchor, constant: 30),
            self.tempCityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            self.tempCityLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

        ])
    }
}
