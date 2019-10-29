//
//  ViewController.swift
//  Artable
//
//  Created by Ashraf Ahmed on 27/10/19.
//  Copyright © 2019 Shakil Ahammed. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class HomeViewController: UIViewController {
    @IBOutlet weak var loginoutBarButton: UIBarButtonItem!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var categories = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let category = Category(id: "1", name: "Nature", imgUrl: "https://images.unsplash.com/photo-1571993192866-202f70b7ec7e?ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=80", isActive: true, timeStamp: Timestamp())
        let category2 = Category(id: "2", name: "Animal", imgUrl: "https://images.unsplash.com/photo-1571993192866-202f70b7ec7e?ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=80", isActive: true, timeStamp: Timestamp())
        
        let category3 = Category(id: "3", name: "Bird", imgUrl: "https://images.unsplash.com/photo-1571993192866-202f70b7ec7e?ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=80", isActive: true, timeStamp: Timestamp())
        
        let category4 = Category(id: "4", name: "Snake", imgUrl: "https://images.unsplash.com/photo-1571993192866-202f70b7ec7e?ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=80", isActive: true, timeStamp: Timestamp())
        
        let category5 = Category(id: "5", name: "Bird", imgUrl: "https://images.unsplash.com/photo-1571993192866-202f70b7ec7e?ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=80", isActive: true, timeStamp: Timestamp())
        
        let category6 = Category(id: "6", name: "Snake", imgUrl: "https://images.unsplash.com/photo-1571993192866-202f70b7ec7e?ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=80", isActive: true, timeStamp: Timestamp())
        
        categories.append(category)
        categories.append(category2)
        categories.append(category3)
        categories.append(category4)
        categories.append(category5)
        categories.append(category6)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: XIB.CategoryCell, bundle: nil), forCellWithReuseIdentifier: Identifier.CategoryCell)
        
        if let _ = Auth.auth().currentUser{
            loginoutBarButton.title = "log out"
        }else{
            loginoutBarButton.title = "login"
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let _ = Auth.auth().currentUser{
            loginoutBarButton.title = "log out"
        }else{
            loginoutBarButton.title = "login"
        }
    }

    @IBAction func loginoutClicked(_ sender: Any) {
        if let _ = Auth.auth().currentUser{
            do {
                try Auth.auth().signOut()
            } catch let signOutError as NSError {
              print ("Error signing out: %@", signOutError)
            }
            presentLogInController()
        }else{
            presentLogInController()
        }
    }
    
    func presentLogInController() {
        let loginStoryboard = UIStoryboard(name: Storyboard.LoginStoryboard, bundle: nil)
        let loginViewController = loginStoryboard.instantiateViewController(identifier: StoryboardId.LoginStoryboard)
        let navigationController = UINavigationController(rootViewController: loginViewController)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true, completion: nil)
    }
}

extension HomeViewController : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.CategoryCell, for: indexPath) as? CategoryViewCell{
            cell.configureCell(category: categories[indexPath.item])
            
            let fullWidth = collectionView.bounds.width
            let contentWidth = (fullWidth - 10) / 2
            let contentHeight = contentWidth * 1.5
            
            cell.widthAnchor.constraint(equalToConstant: contentWidth).isActive = true
            cell.heightAnchor.constraint(equalToConstant: contentHeight).isActive = true
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
}
