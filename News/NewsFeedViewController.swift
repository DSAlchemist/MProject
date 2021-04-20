//
//  NewsFeedViewController.swift
//  MProject
//
//  Created by Danil G. on 24.03.2021.

// Это черновик. На данный момент проект на доработке. Ликвидируются прошлые хвосты, устраняются недоработки, поэтопно будет выгружаться по готовности.
//

import UIKit

class NewsFeedTableViewController: UITableViewController {

//    let networkManager = NetworkManager.shared
//    private var newsPosts = [NewsPost]()
//    private var users = [Int:User]()
//    private var groups = [Int:Group]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        networkManager.loadNewsPost(token: Session.shared.token) { [weak self] news, users, groups in
//            DispatchQueue.main.async {
//                self?.newsPosts = news
//                self?.users = users
//                self?.groups = groups
//                self?.tableView.reloadData()
//            }
//        }
//        tableView.register(UINib(nibName: Constants.newsCellIdentifier, bundle: nil), forCellReuseIdentifier: Constants.newsCellIdentifier)
//    }
//
// Заметка по 7 уроку!!!
//    
//    class Photo {
//       let id: Int
//       let date: Date
//       let width: Int
//       let height: Int
//       let url: URL
//        
//        
//        // Добавим вычисляемый параметр aspectRatio
//          var aspectRatio: CGFloat { return CGFloat(height)/CGFloat(width) }
//         
//          init?(json: JSON) {
//              guard let sizesArray = json["photo"]["sizes"].array,
//                  let xSize = sizesArray.first(where: { $0["type"].stringValue == "x" }),
//                  let url = URL(string: xSize["url"].stringValue) else { return nil }
//             
//              self.width = xSize["width"].intValue
//              self.height = xSize["height"].intValue
//              self.url = url
//              let timeInterval = json["date"].doubleValue
//              self.date = Date(timeIntervalSince1970: timeInterval)
//              self.id = json["id"].intValue
//          }
//       }
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//           switch indexPath.row {
//           // Ячейки с фото у нас, например, имеют .row == 2
//           case 2:
//                   // Вычисляем высоту
//                   let tableWidth = tableView.bounds.width
//                   let news = self.news[indexPath.section]
//                   let cellHeight = tableWidth * news.aspectRatio
//                   return cellHeight
//           default:
//           // Для всех остальных ячеек оставляем автоматически определяемый размер
//                   return UITableView.automaticDimension
//              
//           }
//       }

//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return newsPosts.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.newsCellIdentifier,
//                                                    for: indexPath) as? NewsCell {
//            let news = newsPosts[indexPath.row]
//
//            parseTableData(news: news) { (newsPostViewModel) in
//                
//                
//                DispatchQueue.main.async {
//                    cell.setup(newsPostViewModel: newsPostViewModel)
//                }
//            }
//            
//            return cell
//        }
//        return UITableViewCell()
//    }
//    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        tableView.beginUpdates()
//        
//        if let cell = tableView.cellForRow(at: indexPath) as? NewsCell {
//            cell.newsText.numberOfLines = cell.newsText.calculateMaxLines()
//        }
//        tableView.endUpdates()
//    }
//}
//
//extension NewsTableViewController {
//    func parseTableData(news: NewsPost, completion: @escaping (NewsPostViewModel) -> ()) {
//        DispatchQueue.global().async {
//            var authorName = ""
//            var authorAvatar: URL
//            if news.sourceID > 0 {
//                authorName = self.users[news.sourceID]!.name
//                authorAvatar = self.users[news.sourceID]!.avatarURL
//            } else {
//                authorName = self.groups[-news.sourceID]!.name
//                authorAvatar = self.groups[-news.sourceID]!.avatarURL
//            }
//            
//            let postViewModel = NewsPostViewModel(newsPost: news, authorName: authorName, avatarURL: authorAvatar)
//            completion(postViewModel)
//        }
//    }
}
