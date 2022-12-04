//
//  ViewController.swift
//  GenericNetworkLayer
//
//  Created by Samed Dağlı on 4.12.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NowPlayingService().fetchTopMovies(language: "en-US", page: 1) { result in
            switch result {
            case .success(let movies):
                print(movies.results[0].originalTitle)
            case .failure(let error):
                print(error)
            }
        }
        
        TopRatedService().fetchTopRatedMovies(language: "en-US", page: 1) { result in
            switch result {
            case .success(let movies):
                print(movies.results[0].originalTitle)
            case .failure(let error):
                print(error)
            }
        }
    }


}

