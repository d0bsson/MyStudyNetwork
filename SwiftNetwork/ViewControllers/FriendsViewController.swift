//
//  FriendsViewController.swift
//  SwiftNetwork
//
//  Created by Дэвид Бердников on 05.05.2021.
//

import UIKit

class FriendViewController: UITableViewController {
    
    private var friends: [Friend] = []

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FriendCell
        let friend = friends[indexPath.row]
        cell.configure(with: friend)
        return cell
    }
}

extension FriendViewController {
    func fetchFriends(from url: String?) {
        NetworkManager.shared.fetchFriend(from: url ?? "") { (friend) in
            self.friends = friend
            self.tableView.reloadData()
        }
    }
}

    

