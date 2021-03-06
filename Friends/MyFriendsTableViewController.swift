//
//  MyFriendsTableViewController.swift
//  MProject
//
//  Created by Danil G. on 06.03.2021.
//

import UIKit

class MyFriendsTableViewController: UITableViewController {

    var myFriends = [Friend]()
    var filteredFriends = [Friend]()
    var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    var filtering: Bool {
        return searchController.isActive && !searchBarIsEmpty

    }
    let searchController = UISearchController(searchResultsController: nil)
    var friendSections = [FriendsSections]()
    let networkManager = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        networkManager.getFriends() { [weak self] (myFriends) in
            self?.myFriends = myFriends

            let friendsDictionary = Dictionary.init(grouping: myFriends) {
                $0.lastName.prefix(1)
            }
            self?.friendSections = friendsDictionary.map { FriendsSections(title: String($0.key), items: $0.value) }
            self?.friendSections.sort { $0.title < $1.title }

            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск..."
        searchController.searchBar.setValue("Отмена", forKey: "cancelButtonText")
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    override func viewWillAppear(_ animated: Bool) {

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        if filtering {
            return 1
        } else {
            return friendSections.count
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if filtering {
            return filteredFriends.count
        }
        return friendSections[section].items.count
    }

    override func sectionIndexTitles(for tableView: UITableView) -> [String]? { friendSections.map { $0.title } }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyFriendsTableViewCell", for: indexPath) as? MyFriendsTableViewCell
        else { return UITableViewCell() }
        var friends: Friend
        if filtering {
            friends = filteredFriends[indexPath.row]
        } else {
            friends = friendSections[indexPath.section].items[indexPath.row]
        }
        cell.configure(with: friends)
        return cell
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 10.0))
        view.backgroundColor = .systemGray5
        let label = UILabel(frame: CGRect(x: 42, y: 5, width: tableView.frame.width - 10, height: 20.0))
        label.font = UIFont(name: "Avenir Medium", size: 18.0)
        label.text = friendSections[section].title
        view.addSubview(label)
        return view
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "ShowUserInfo" {
//            let controller = segue.destination as! ImagesGalleryViewController
//            if let index = tableView.indexPathForSelectedRow {
//                var friends: Friend
//                if filtering {
//                    friends = filteredFriends[index.row]
//                } else {
//                    friends = friendSections[index.section].items[index.row]
//                }
//                controller.friend = friends
//                controller.title = ("\(friends.lastName) \(friends.firstName)")
//            }
//        }
//    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension MyFriendsTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    func filterContentForSearchText(_ searchText: String) {
        filteredFriends = myFriends.filter({ (myFriends: Friend) -> Bool in
            return myFriends.lastName.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }

}
