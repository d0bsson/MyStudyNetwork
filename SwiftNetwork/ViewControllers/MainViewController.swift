//
//  MainViewController.swift
//  SwiftNetwork
//
//  Created by Дэвид Бердников on 04.05.2021.
//

import UIKit

class MainViewController: UICollectionViewController {
    
    
    
    private let userActions = UserActions.allCases
    private var friend: [Friend] = []
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        userActions.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserActionCell
        
        cell.userActionLabel.text = userActions[indexPath.item].rawValue
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userAction = userActions[indexPath.item]
        
        switch userAction {
        case .friends: fetchData1(from: URLExamples.UrlJson.rawValue)
        case .friendsInInterface: performSegue(withIdentifier: "tableViewSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tableViewSegue" {
            guard let friendsVC = segue.destination as? FriendsViewController else { return }
            friendsVC.fetch
        }
    }
    
    
    private func fetchData1(from url: String?) {
        
        NetworkManager.shared.fetchData(from: url) {  friend in
            self.friend = friend
            self.collectionView.reloadData()
        }
    }
}


extension MainViewController {
    private func fetchData() {
        guard let url = URL(string: URLExamples.UrlJson.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description" )
                return
            }
            
            do {
                let friend = try JSONDecoder().decode([Friend].self, from: data)
                print(friend)
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}


extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 24, height: 130)
    }
}


