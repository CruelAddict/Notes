//
//  NotesViewController.swift
//  Notes
//
//  Created by Alexey Petrenko on 10.05.2018.
//  Copyright © 2018 Alexey Petrenko. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var numberOfDisplayedNotes = 0
    var displayedNotes : [Note]? = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfDisplayedNotes
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .clear
        cell.textLabel?.text = "This is cell number \(indexPath.row)"
        cell.textLabel?.textColor = .white
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTaped))
        if var displayedNotes = UserDefaults.standard.object(forKey: "Notes") as? [Note]{
            numberOfDisplayedNotes = displayedNotes.count
        }
        
    }
    
    @objc func addTaped() {
        let alertController = UIAlertController(title: "New Note", message: "Add new note", preferredStyle: .alert)
        alertController.addTextField()
        let save = UIAlertAction(title: "Save", style: .default) { _ in
            guard let textField = alertController.textFields?.first, textField.text != "" else { return }
            var newNote = Note(creator: appUser, name: textField.text!)
            self.displayedNotes?.append(newNote)
            UserDefaults.standard.set(self.displayedNotes, forKey: "memNotes")
        }
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertController.addAction(save)
        alertController.addAction(cancel)
        present(alertController, animated: true, completion: nil)
    }
    
}
