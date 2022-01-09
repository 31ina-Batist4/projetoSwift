//
//  DenunciaTableViewController.swift
//  CidadeLimpa
//
//  Created by user209392 on 1/7/22.
//

import UIKit
import CoreData

class DenunciaTableViewController: UITableViewController {
    
    var fetchedResultsController:NSFetchedResultsController<Denuncia>!

    //var denuncias: [Denuncia] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loadDenuncias()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
       
        if let denunciaViewController = segue.destination as? DenunciaViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            denunciaViewController.denuncia = fetchedResultsController.object(at: indexPath)
            
        }
    }
    func loadDenuncias() {
        let fetchRequest: NSFetchRequest<Denuncia> = Denuncia.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "nome", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController.delegate = self
        try? fetchedResultsController.performFetch()
        }
        
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fetchedResultsController.fetchedObjects?.count ?? 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? DenunciaTableViewCell else {
            return UITableViewCell()
        }
       
        let denuncia = fetchedResultsController.object(at: indexPath)
         cell.configureWith(denuncia)
    

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let denuncia = fetchedResultsController.object(at: indexPath)
            context.delete(denuncia)
            try? context.save()
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DenunciaTableViewController: NSFetchedResultsControllerDelegate {
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        tableView.reloadData()
    }
}
