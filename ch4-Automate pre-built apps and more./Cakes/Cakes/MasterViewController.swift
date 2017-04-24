//
//  MasterViewController.swift
//  Cakes
//
//  Created by Alpa Sanghavi on 12/20/16.
//  Copyright © 2016 Alpa Sanghavi. All rights reserved.
//


import UIKit

class MasterViewController: UITableViewController {
    
    
    var cakes = [Cake]()
    
    var detailViewController: DetailViewController? = nil
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
        
        let receipe_choc_cake : String = "In a bowl, cream butter and sugar until fluffy\n Add eggs, one at a time, beating well after each addition. Combine flour, cocoa, eggs,one at a time, beating well after each addition.\n Combine flour, cocoa, baking soda and salt; add to creamed mixture alternately with milk, beating until smoothafter each addition.\n Pour batter into a greased and floured 13-in by 9 inc pan.\nFor cupcakes, bake 20 to 25 minutes.\nCake is done when it springs back to the touch."
        
        
        let receipe_van_cake : String = "Preheat oven to 350 degrees F (175 degrees C). Grease and flour a 9x9 inch pan or line a muffin pan with paperliners.\n In a medium bowl, cream together the sugar and butter. Beat in the eggs, one at a time, then stir in the vanilla.\n Combine flour and baking powder, add to the creamed mixture and mix well. Finally stir in the milk until batter is smooth.\n Pour or spoon batter into the prepared pan.\n Bake for 30 to 40 minutes in the preheated oven. For cupcakes, bake 20 to 25 minutes.\nCake is done when it springs back to the touch."
        
        let receipe_dark_forest = "In a large bowl, combine flour, 2 cups sugar, cocoa, baking powder, baking soda, and salt. Add eggs, milk, oil, and 1 tablespoon vanilla, beat until well blended.\nPour batter into prepared pans.Bake for 35 minutes, or until wooden toothpick inserted in centers comes out clean. Cool layers in pans on wire racks 10 minutes. Loosen edges, and remove to racks to cool completely.\nDrain cherries, reserving 1/2 cup juice. Combine reserved juice, cherries, 1 cup sugar and cornstarch in a 2 quart saucepan. Cook over low heat until thickened, stirring constantly. Stir in 1 teaspoon vanilla. Cool before using.\nCombine whipping cream and confectioner's sugar in a chilled medium bowl. Beat with an electric mixer at high speed until stiff peaks form.With long serrated knife, split each cake layer horizontally in half. Tear one split layer into crumbs, set aside.\nReserve 1 1/2 cups Frosting for decorating cake; set aside. Gently brush loose crumbs off top and side of each cake layer with pasty brush or hands. To assemble, place one cake layer on cake plate. Spread with 1 cup frosting, top with 3/4 cup cherry topping.\n Top with second cake layer; repeat layers of frosting and cherry topping. Top third cake layer. Frost side of cake. Pat reserved crumbs onto frosting on side of cake. Spoon reserved frosting into pastry bag fitted with star decorator tip. Pipe around top and bottom edges of cake.Spoon remaining cherry topping onto top of cake."
        
        
        let receipe_red_velevet = "Beat butter and 1 1/2 cups sugar until very light and fluffy.\n Add eggs and beat well.Make a paste of cocoa and red food coloring,add to creamed mixture.\n Mix salt, 1 teaspoon vanilla, and buttermilk together. Add the flour to the batter, alternating with the buttermilk mixture, mixing just until incorporated. Mix soda and vinegar and gently fold into cake batter. Don't beat or stir the batter after this point.\n Pour batter into prepared pans.\nBake in preheated oven until a tester inserted into the cake comes out clean, about 30 minutes. Cool cakes completely on wire rack.\n To Make Icing: Cook 5 tablespoons flour and milk over low heat till thick, stirring constantly. Let cool completely! While mixture is cooling, beat 1 cup sugar, butter, and 1 teaspoon vanilla until light and fluffy. Add cooled flour mixture and beat until frosting is a good spreading consistency. Frost cake layers when completely cool."
        
        
        let receipe_strawberry = "In a large bowl, cream together the butter, sugar and dry strawberry gelatin until light and fluffy. Beat in eggs one at a time, mixing well after each.\n Combine the flour and baking powder; stir into the batter alternately with the milk.\n Blend in vanilla and strawberry puree. Divide the batter evenly between the prepared pans.\n Bake for 25 to 30 minutes in the preheated oven, or until a small knife inserted into the center of the cake comes out clean.Allow cakes to cool in their pans over a wire rack for at least 10 minutes, before tapping out to cool completely."
        
        
        
        
        
        //    init(name: String, description: String, iconName: String, cake: Cake) {
        
        self.cakes.append(Cake(name:"Choclate Cake",description: receipe_choc_cake, type : Cake_type.Choclate))
        
        self.cakes.append(Cake(name:"Vanilla Cake",description: receipe_van_cake, type : Cake_type.Vanilla))
        
        self.cakes.append(Cake(name:"DarkForest Cake",description: receipe_dark_forest,  type : Cake_type.BlackForest))
        
        self.cakes.append(Cake(name:"Red Velvet Cake",description: receipe_red_velevet,  type : Cake_type.RedVelvet))
        
        self.cakes.append(Cake(name:"Strawberry Cake",description: receipe_strawberry,  type : Cake_type.Strawberry))
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        // let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        //self.navigationItem.rightBarButtonItem = addButton
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
            
        }
        
        
        let initialIndexPath = NSIndexPath(row: 0, section: 0)
        
        self.tableView.selectRow(at: initialIndexPath as IndexPath, animated: true, scrollPosition:UITableViewScrollPosition.none)
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            self.performSegue(withIdentifier: "showDetail", sender: initialIndexPath)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = cakes[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                
                
            }
            
        }
    }
    
    
    // MARK: - Table View
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cakes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        
        let cake_text = self.cakes[indexPath.row]
        cell.textLabel?.text = cake_text.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cakes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    
}


