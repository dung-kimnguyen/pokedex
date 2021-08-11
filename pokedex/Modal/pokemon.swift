//
//  pokemon.swift
//  pokedex
//
//  Created by Nocero Beguhe on 08/10/21.
//  Copyright © 2021 Nocero Beguhe. All rights reserved.
//

import Foundation

class Pokemon{
    
    private var _name : String!
    private var _pokedexId : Int!
    private var _description: String!
    private var _monsterType: String!
    private var _defense: Int!
    private var _attack: Int!
    private var _length: Int!
    private var _weight: Int!
    private var _nextEvolution: String!
    
    private var _pokemonURL: String!
    
    var name : String {
        return _name
    }
    
    var pokedexId : Int {
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int){
        
        self._name = name
        self._pokedexId = pokedexId
        
        self._pokemonURL = "\(BASE_URL)\(POKE_URL)\(self.pokedexId)/"
        //        print(self._pokemonURL)
    }
    
    func downloadPokemonData(completed: @escaping DownloadComplete){
        
        let task =  URLSession.shared.dataTask(with: URL(string:"https://pokeapi.co/api/v2/pokemon/1/")!) {(data, response, error) in
            
            if let dataJson = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: dataJson, options:[]) as! Dictionary<String, Any>
                    
                    //  download raw pokemon data
                    if let weight = json["weight"] as? Int {
                        self._weight = weight
                    }
                    if let length = json["height"] as? Int {
                        self._length = length
                    }
                    if let stats = json["stats"] as? [Dictionary<String, AnyObject>]{
                        if let baseAttack = stats[4]["base_stat"] as? Int{
                            self._attack = baseAttack
                        }
                    }
                    if let types = json["types"] as? [Dictionary<String, AnyObject>]{
                        var monsterType = ""
                        for x in 0..<types.count{
                            if let typedict = types[x]["type"] as? Dictionary<String,String>{
                                monsterType += "/\(typedict["name"] ?? "")"
                                
                            }
                            self._monsterType = monsterType
                        }
                    }else{
                        self._monsterType = "unknown"
                    }
                }
                catch {}
            }
        }
            task.resume()
        }
    }
