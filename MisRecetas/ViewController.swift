//
//  ViewController.swift
//  MisRecetas
//
//  Created by Cristhian Parrales on 29/1/17.
//  Copyright © 2017 Cristhian Parrales. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var recipes : [Recipe] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style: .plain, target: nil, action: nil)
        
        var recipe = Recipe(name: "Tortilla de camaron",
                            image: #imageLiteral(resourceName: "tortilla"),
                            time: 20,
                            ingredients: ["Patatas", "Huevos", "Cebolla"],
                            steps: ["Pelar las patatas",
                                    "Cortas las patatas y la cebolla",
                                    "Batir los huevos y echarlos durante 1 munito a la sarten con el resto"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Pizza jamon con queso",
                        image: #imageLiteral(resourceName: "pizza"),
                        time: 60,
                        ingredients: ["Harina", "Lavadura", "Aceite", "Sal", "Salsa de tomate", "Queso"],
                        steps: ["Hacemos la masa con harina, levadura, aceite y sal",
                                "Dejamos reposar la masa 30 minutos",
                                "Extendemos la masa encima de una bandeja y anadimos el resto de los ingredientes",
                                "Hornear durante 12 minutos"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Hamburguesa con queso",
                        image: #imageLiteral(resourceName: "hamburgesa"),
                        time: 10,
                        ingredients: ["Pan de hamburguesa", "Lechuga", "Tomate", "Queso", "Carne de hamburguesa"],
                        steps: ["Poner al fuego la carne al gusto",
                                "Montar la hamburguesa con sus ingredientes entre los panes"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Ensalada cesar",
                        image: #imageLiteral(resourceName: "ensalada"),
                        time: 15,
                        ingredients: ["Lechuga", "Tomate", "Cebolla", "Pimiento", "Salsa Cesar", "Pollo"],
                        steps: ["Limpiar todas las verduras y trociarlas",
                                "Cocer el pollo al gusto",
                                "Juntar todos los ingredientes en una ensaladera y servir con salsa Cesar por encima"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Bolo de chicharon",
                        image: #imageLiteral(resourceName: "bolon"),
                        time: 20,
                        ingredients: ["Verde", "Chicharon", "Aceite", "Sal"],
                        steps: ["Pelar los verdes",
                                "Cocer el verde y chicharon",
                                "Juntar el verde y chicharon y hacer una bola"])
        recipes.append(recipe)

        recipe = Recipe(name: "Ceviche de pescado",
                        image: #imageLiteral(resourceName: "ceviche"),
                        time: 30,
                        ingredients: ["Pescado", "Cebolla", "Aceite", "Sal", "Tomate", "limon"],
                        steps: ["Limpiar los ingredientes",
                                "Cocer el pescado",
                                "Picar la cebolla y tomate",
                                "Servir en plato profundo con juguito y limon al gusto"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Sopa de concha",
                        image: #imageLiteral(resourceName: "sopa"),
                        time: 25,
                        ingredients: ["Concha", "Arroz", "Sal"],
                        steps: ["Abrir la concha",
                                "Cocer la concha con el arroz hasta que este espeso"])
        recipes.append(recipe)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
    }
    

    //MARK: - UITableviewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cellID = "RecipeCell"
        //let cellID = "FullRecipeCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! RecipeCell
       // let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! FullRecipeCell
        
        //cell.fullImage.image = recipe.image
        //cell.name.text = recipe.name
        
        
        cell.thumbnailImageView.image = recipe.image
        cell.nameLabel.text = recipe.name
        cell.timeLabel.text = "\(recipe.time!) min"
        cell.ingredientsLabel.text = "Ingredientes: \(recipe.ingredients.count)"
        
        
//        if recipe.isFavourite {
  //          cell.accessoryType = .checkmark
    //    } else {
      //      cell.accessoryType = .none
        //}
        
      /*  // hace circular las imagenes
        cell.thumbnailImageView.layer.cornerRadius = 47 // la mitad de alto de la imagen
        cell.thumbnailImageView.clipsToBounds = true
        */
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.recipes.remove(at: indexPath.row)
            
        }
        
     //   tableView.reloadData() // recarga toda la tabla, lo que no es eficiente si tienes una tablacon muchos datos
        self.tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        // Compartir
        let shareAction = UITableViewRowAction(style: .default, title: "Compartir") { (action, indexPath) in
            let shareDefaultText = "Estoy mirando la receta de \(self.recipes[indexPath.row].name) en el App del curso iOS 10 de Juan Gabriel"
            let activityController = UIActivityViewController(activityItems: [shareDefaultText, self.recipes[indexPath.row]], applicationActivities: nil)
            self.present(activityController, animated: true, completion: nil)
        }
        shareAction.backgroundColor = UIColor(red: 30.0/255.0, green: 164.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        
        // Borrar
        let deleteAction = UITableViewRowAction(style: .default, title: "Borrar") { (action, indexPath) in
            self.recipes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 202.0/255.0, alpha:  1.0)
        
        return [shareAction, deleteAction]
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     /*
        let recipe = self.recipes[indexPath.row]
        
        let alertController = UIAlertController(title: recipe.name, message: "Valora este plato", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        var favouriteActionTitle = "Favorito"
        var favouriteActionStyle = UIAlertActionStyle.default
        if recipe.isFavourite {
            favouriteActionTitle = "No favorito"
            favouriteActionStyle = UIAlertActionStyle.destructive
        }
        
        let favouriteAction = UIAlertAction(title: favouriteActionTitle, style: favouriteActionStyle) { (action) in
            let recipe = self.recipes[indexPath.row]
            recipe.isFavourite = !recipe.isFavourite
            self.tableView.reloadData()
        }
        
        alertController.addAction(favouriteAction)
        
        self.present(alertController, animated: true, completion: nil)
 */   
 }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipeDetail" {
            if let indePath = self.tableView.indexPathForSelectedRow {
                let selectedRecipe = self.recipes[indePath.row]
                let destinationViewController = segue.destination as! DetailViewController
                destinationViewController.recipe = selectedRecipe
            }
        }
    }
    
    
}































