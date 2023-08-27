//
//  PersonnelLossesTableViewCell.swift
//  StandWithUkraineUIKit
//
//  Created by Baidetskyi Jurii on 27.08.2023.
//

import UIKit

class PersonnelLossesTableViewCell: UITableViewCell {
    private var personnelLosses = [PersonnelLossesModel]()
    private let cellReuseIdentifier = "PersonnelLossesCollectionViewCell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configCell(_ personnelLosses: [PersonnelLossesModel]) {
        self.personnelLosses = personnelLosses
        registerCollectionCell()
        collectionView.delegate = self
        collectionView.dataSource =  self
        collectionView.reloadData()
    }
    
    private func registerCollectionCell() {
        collectionView.register(PersonnelLossesCollectionViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        collectionView.register(UINib(nibName: cellReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: cellReuseIdentifier)
    }
}

extension PersonnelLossesTableViewCell: UICollectionViewDelegate {}

extension PersonnelLossesTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 100)
    }
}

extension PersonnelLossesTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        personnelLosses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as? PersonnelLossesCollectionViewCell else {
            return UICollectionViewCell()
        }

        cell.cellBackgroundView.layer.cornerRadius = 12
        cell.configCell(with: personnelLosses[indexPath.row])
        return cell
    }
}
