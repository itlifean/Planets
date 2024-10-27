//
//  PlanetDetailsViewController.swift
//  Planets1
//
//  Created by Ana Oganesiani on 27.10.24.
//
import UIKit

class PlanetDetailsViewController: UIViewController {

    var planet: Planet?

    let planetImageView = UIImageView()
    let areaLabel = UILabel()
    let temperatureLabel = UILabel()
    let massLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(red: 33/255, green: 13/255, blue: 4/255, alpha: 1.0)


        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.tintColor = UIColor(red: 179/255, green: 68/255, blue: 22/255, alpha: 1.0)  // Hex #B34416
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton

        self.title = planet?.name
        let titleLabel = UILabel()
        titleLabel.text = planet?.name
        titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        titleLabel.textColor = UIColor(red: 179/255, green: 68/255, blue: 22/255, alpha: 1.0)  // Hex #B34416
        self.navigationItem.titleView = titleLabel

        setupViews()
    }

    func setupViews() {
        planetImageView.translatesAutoresizingMaskIntoConstraints = false
        areaLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        massLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(planetImageView)
        view.addSubview(areaLabel)
        view.addSubview(temperatureLabel)
        view.addSubview(massLabel)

 
        NSLayoutConstraint.activate([
            planetImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            planetImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            planetImageView.widthAnchor.constraint(equalToConstant: 250),
            planetImageView.heightAnchor.constraint(equalToConstant: 250),


            areaLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            areaLabel.topAnchor.constraint(equalTo: planetImageView.bottomAnchor, constant: 40),
            areaLabel.widthAnchor.constraint(equalToConstant: 300),
            areaLabel.heightAnchor.constraint(equalToConstant: 50),

            temperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            temperatureLabel.topAnchor.constraint(equalTo: areaLabel.bottomAnchor, constant: 10),
            temperatureLabel.widthAnchor.constraint(equalToConstant: 300),
            temperatureLabel.heightAnchor.constraint(equalToConstant: 50),

            massLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            massLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 10),
            massLabel.widthAnchor.constraint(equalToConstant: 300),
            massLabel.heightAnchor.constraint(equalToConstant: 50)
        ])


        if let planet = planet {
            planetImageView.image = UIImage(named: planet.imageName)
            areaLabel.text = "  Area                      \(planet.area)"
            temperatureLabel.text = "  Temperature        -18°C"
            massLabel.text = "  Mass                      6.39E23 kg"

            let labels = [areaLabel, temperatureLabel, massLabel]
            for label in labels {
                label.font = UIFont.systemFont(ofSize: 18)
                label.textColor = .white
                label.layer.borderColor = UIColor.lightGray.cgColor
                label.layer.borderWidth = 1
                label.layer.cornerRadius = 10
                label.layer.masksToBounds = true
            }
        }
    }
}
