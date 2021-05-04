//
//  MainViewController.swift
//  SwiftNetwork
//
//  Created by Дэвид Бердников on 04.05.2021.
//

import UIKit

private let reuseIdentifier = "Cell"

class MainViewController: UICollectionViewController {
    
    let userActions = UserActions.allCases

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        userActions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserActionCell
    
        return cell
    }

}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 24, height: 130)
    }
}
