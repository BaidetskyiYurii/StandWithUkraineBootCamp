//
//  EquipmentDetailLossesViewController.swift
//  StandWithUkraineUIKit
//
//  Created by Baidetskyi Jurii on 27.08.2023.
//

import UIKit

class EquipmentDetailLossesViewController: UIViewController {
    var equipmentItem: EquipmentLossesModel?
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        view.layer.cornerRadius = 20
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContentUI()
        configureLabelsUI(with: equipmentItem)
    }
    
    private func configureContentUI() {
        view.backgroundColor = .white
        view.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            contentView.widthAnchor.constraint(equalToConstant: 350),
            contentView.heightAnchor.constraint(equalToConstant: 600)
        ])
    }
    
    private func configureLabelsUI(with item: EquipmentLossesModel?) {
        guard let item = item else {
            return
        }
        
        let titleLabel = createLabel(text: "Equipment Losses", font: .boldSystemFont(ofSize: 18))
        contentView.addSubview(titleLabel)
        
        var labels: [UILabel] = [
            createLabel(text: "Date: \(item.date)", font: .systemFont(ofSize: 16)),
            createLabel(text: "Tank Losses: \(item.tank)", font: .systemFont(ofSize: 16)),
            createLabel(text: "Aircraft Losses: \(item.aircraft)", font: .systemFont(ofSize: 16)),
            createLabel(text: "Helicopters Losses: \(item.helicopter)", font: .systemFont(ofSize: 16)),
            createLabel(text: "Armored Personnel Carriers Losses: \(item.APC)", font: .systemFont(ofSize: 16)),
            createLabel(text: "Field Artillery SystemsLosses: \(item.fieldArtillery)", font: .systemFont(ofSize: 16)),
            createLabel(text: "Drones (UAV+RPA) Losses: \(item.drone)", font: .systemFont(ofSize: 16)),
            createLabel(text: "Naval Ships (Warships, Boats) Losses: \(item.navalShip)", font: .systemFont(ofSize: 16)),
            createLabel(text: "Anti-aircraft Warfare Systems Losses: \(item.antiAircraftWarfare)", font: .systemFont(ofSize: 16))
        ]
        
        if let militaryAuto = item.militaryAuto,
           let fuelTank = item.fuelTank {
            labels.append(createLabel(text: "Military Autos Losses: \(militaryAuto)", font: .systemFont(ofSize: 16)))
            labels.append(createLabel(text: "Fuel Tanks Losses: \(fuelTank)", font: .systemFont(ofSize: 16)))
        }
        
        let stackView = UIStackView(arrangedSubviews: labels)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    private func createLabel(text: String, font: UIFont) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = font
        label.textColor = .black
        return label
    }
}
