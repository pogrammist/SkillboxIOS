//
//  ViewController.swift
//  Lesson12
//
//  Created by Nikita Arkhipov on 18.03.2020.
//  Copyright © 2020 Nikita Arkhipov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var categories: [Category] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let loader = CategoriesLoader()
//        loader.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        CategoriesLoader().loadCategories2 { categories in
            self.categories = categories
            self.tableView.reloadData()
        }
    }

}

//extension ViewController: CategoriesLoaderDelegate{
//    func loaded(categories: [Category]) {
//        self.categories = categories
//        tableView.reloadData()
//    }
//}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        let cat = categories[indexPath.row]
        cell.nameLabel.text = cat.name
        cell.sortOrederLabel.text = "\(cat.sortOrder)"
        let imageURL = cat.imageURL
        guard let url = URL(string: imageURL) else { return cell }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            print("Done!")
            guard let data = data else { return }
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                cell.previewImageView.image = image
            }
        }
        task.resume()
        return cell
    }
}

