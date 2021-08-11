//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by Nocero Beguhe on 08/10/21.
//  Copyright © 2021 Nocero Beguhe. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon : Pokemon!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var descText: UITextView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var evolutionLabel: UILabel!
    @IBOutlet weak var pokedexLabel: UILabel!
    @IBOutlet weak var currentEvoImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = self.pokemon.name
        pokedexLabel.text = "\(self.pokemon.pokedexId)"
        mainImage.image = UIImage(named: "\(self.pokemon.pokedexId)")
        currentEvoImage.image = UIImage(named: "\(self.pokemon.pokedexId)")

        pokemon.downloadPokemonData {
            //Code after network call complete
            print("download finished")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
   }

    @IBAction func backBtnPress(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    func updateUI(){

    }

}
