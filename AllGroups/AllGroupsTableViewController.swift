//
//  AllGroupsTableViewController.swift
//  MProject
//
//  Created by Danil G. on 06.03.2021.
//

import UIKit

class AllGroupsTableViewController: UITableViewController {

    let networkManager = NetworkManager()
    var allGroups = [Community]()
    var filteredGroups = [Community]()
    var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    var filtering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    let searchController = UISearchController(searchResultsController: nil)
    var allGroupsSections = [GroupsSection]()

    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.searchCommunity(token: Session.shared.token, group: " ") { [weak self] (allGroups) in
            self?.allGroups = allGroups
            let allGroupsDictionary = Dictionary.init(grouping: allGroups) {
                $0.groupName.prefix(1)
            }
            self?.allGroupsSections = allGroupsDictionary.map { GroupsSection(title: String($0.key), items: $0.value) }
            self?.allGroupsSections.sort { $0.title < $1.title }
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
            return allGroupsSections.count
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if filtering {
            return filteredGroups.count
        }
        return allGroupsSections[section].items.count
    }

    override func sectionIndexTitles(for tableView: UITableView) -> [String]? { allGroupsSections.map { $0.title } }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupsTableViewCell", for: indexPath) as? AllGroupsTableViewCell
        else { return UITableViewCell() }
        var groups: Community
        if filtering {
            groups = filteredGroups[indexPath.row]
        } else {
            groups = allGroupsSections[indexPath.section].items[indexPath.row]
        }
        cell.configure(with: groups)
        return cell
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 10.0))
        view.backgroundColor = .systemGray5
        let label = UILabel(frame: CGRect(x: 42, y: 5, width: tableView.frame.width - 10, height: 20.0))
        label.font = UIFont(name: "Avenir Medium", size: 18.0)
        label.text = allGroupsSections[section].title
        view.addSubview(label)
        return view
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension AllGroupsTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }

    func filterContentForSearchText(_ searchText: String) {
        filteredGroups = allGroups.filter({ (allGroups: Community) -> Bool in
            networkManager.searchCommunity(token: Session.shared.token, group: searchText.lowercased()) { [weak self] groups in
                print(searchText)
                self?.allGroups = groups
            }
            return allGroups.groupName.contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
}
