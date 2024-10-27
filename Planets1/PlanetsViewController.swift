//
//  PlanetsViewController.swift
//  Planets1
//
//  Created by Ana Oganesiani on 27.10.24.
//

import UIKit

class PlanetsViewController: UITableViewController {

    let planets = [
        Planet(name: "Mars", area: "1,258,250 km2", imageName: "mars"),
        Planet(name: "Jupiter", area: "6,142E10 km2", imageName: "jupiter"),
        Planet(name: "Earth", area: "500,100,100 km2", imageName: "earth"),
        Planet(name: "Saturn", area: "2,608,250 km2", imageName: "saturn")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        let titleLabel = UILabel()
        titleLabel.text = "Planets"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        titleLabel.textColor = UIColor(red: 179/255, green: 68/255, blue: 22/255, alpha: 1.0)
        titleLabel.textAlignment = .center
        self.navigationItem.titleView = titleLabel

        self.view.backgroundColor = UIColor(red: 33/255, green: 13/255, blue: 4/255, alpha: 1.0)

        self.tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)

        self.tableView.register(PlanetCell.self, forCellReuseIdentifier: "PlanetCell")
        self.tableView.rowHeight = 100
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlanetCell", for: indexPath) as! PlanetCell
        let planet = planets[indexPath.row]
        cell.configure(with: planet)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let planet = planets[indexPath.row]
        let detailsVC = PlanetDetailsViewController()
        detailsVC.planet = planet
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}
