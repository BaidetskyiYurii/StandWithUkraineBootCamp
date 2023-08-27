//
//  EquipmentViewController.swift
//  StandWithUkraineUIKit
//
//  Created by Baidetskyi Jurii on 26.08.2023.
//

import UIKit

class LossesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var items = [LossesTableCellTypes]()
    private let russiaEquipmentFileName = "russia_losses_equipment"
    private let russiaPesonnelFileName = "russia_losses_personnel"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    private func getData() {
        guard let personnelLossesData: [PersonnelLossesModel] = DataManager.shared.loadData(PersonnelLossesModel.self, fileName: russiaPesonnelFileName),
              let equipmentData: [EquipmentLossesModel] = DataManager.shared.loadData(EquipmentLossesModel.self, fileName: russiaEquipmentFileName)
        else {
            showAlertWithOneButton(message: "Something went wrong", title: "Try Again Later", okActionHandler: { _ in
                self.navigationController?.popViewController(animated: true)
            })
            return
        }
        
        items.append(.personnelLosses(personnelLossesData))
        items.append(contentsOf: equipmentData.map { .equipmentlLosses($0) })
        
        configTableView()
        tableView.reloadData()
    }
    
    private func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        items.forEach { tableView.register(UINib(nibName: $0.nibName, bundle: nil),
                                           forCellReuseIdentifier: $0.indentifier)}
        tableView.reloadData()
    }
}
