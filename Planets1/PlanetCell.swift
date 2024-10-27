//
//  PlanetCell.swift
//  Planets1
//
//  Created by Ana Oganesiani on 27.10.24.
//
import UIKit

class PlanetCell: UITableViewCell {

    let planetImageView = UIImageView()
    let nameLabel = UILabel()
    let areaLabel = UILabel()
    let arrowImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear

        planetImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        areaLabel.translatesAutoresizingMaskIntoConstraints = false
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(planetImageView)
        addSubview(nameLabel)
        addSubview(areaLabel)
        addSubview(arrowImageView)

        nameLabel.font = UIFont.boldSystemFont(ofSize: 28)
        nameLabel.textColor = .white

        areaLabel.font = UIFont.systemFont(ofSize: 18)
        areaLabel.textColor = .lightGray

        arrowImageView.image = UIImage(systemName: "chevron.right")
        arrowImageView.tintColor = .orange

        NSLayoutConstraint.activate([
            planetImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            planetImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            planetImageView.widthAnchor.constraint(equalToConstant: 80),
            planetImageView.heightAnchor.constraint(equalToConstant: 80),

            nameLabel.leadingAnchor.constraint(equalTo: planetImageView.trailingAnchor, constant: 20),
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 25),

            areaLabel.leadingAnchor.constraint(equalTo: planetImageView.trailingAnchor, constant: 20),
            areaLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),

            arrowImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            arrowImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            arrowImageView.widthAnchor.constraint(equalToConstant: 10),
            arrowImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with planet: Planet) {
        planetImageView.image = UIImage(named: planet.imageName)
        nameLabel.text = planet.name
        areaLabel.text = planet.area
    }
}

