//
//  NetworkingManager.swift
//  MProject
//
//  Created by Danil G. on 05.03.2021.
//

import Foundation
import Alamofire

class NetworkManager {
    
    private static let session: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.allowsCellularAccess = false
        let session = URLSession(configuration: configuration)
        
        return session
    }()
    
    private static let sessionAF: Alamofire.Session = {
        let configuration = URLSessionConfiguration.default
        configuration.allowsCellularAccess = false
        let session = Alamofire.Session(configuration: configuration)
        
        return session
    }()
    
    
    static let shared = NetworkManager()
    
    private init() {
        
    }

        static func loadGroups(token: String) {
            let baseURL = "https://api.vk.com"
            let path = "/method/groups.get"
            
            let params: Parameters = [
                "access_token": token,
                "extended": 1,
                "v": "5.92"
            ]
            
            NetworkManager.sessionAF.request(baseURL + path, method: .get, parameters: params).responseJSON { (response) in
                guard let json = response.value else { return }
                
                print(json)
            }
        }
        
//
//                switch response.result {
//                case .success:
//                    if let data = response.data {
//                        do {
//                        let groupResponse = try JSONDecoder().decode(VKGroupResponse.self, from: data)
//                        completion(groupResponse)
//
//                        } catch {
//                            print(error.localizedDescription)
//                        }
//                    }
//                case .failure(let error):
//                    print(error.localizedDescription)
//
//                }
//            }
//        }
    }
