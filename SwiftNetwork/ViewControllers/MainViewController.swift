//
//  MainViewController.swift
//  SwiftNetwork
//
//  Created by Дэвид Бердников on 04.05.2021.
//

import UIKit

private let reuseIdentifier = "Cell"

class MainViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserActionCell
    
        return cell
    }

}


