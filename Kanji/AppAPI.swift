//
//  AppAPI.swift
//  Kanji
//
//  Created by Luis Acosta on 8/11/22.
//

import Foundation

let kanji = ["一","右","雨","円","王","音","下","火","花","貝","学","気","休","玉","金","九","空","月","犬","見","五","口","校","左","三","山","四","子","糸","字","耳","七","車","手","十","出","女","小","上","森","人","水","正","生","青","石","赤","先","千","川","早","草","足","村","大","男","竹","中","虫","町","天","田","土","二","日","入","年","白","八","百","文","本","名","木","目","夕","立","力","林","六"]
let kanjiOfTheDay = kanji.randomElement()!

final class AppAPI {
    
    static let shared =  AppAPI()
    
    func fetchAPI(onCompletion: @escaping (KanjiResults) -> ()) {
        let stringUrl = "https://kanjiapi.dev/v1/kanji/\(String(kanjiOfTheDay))" as String
        
        if let encoded = stringUrl.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed){
            let urlencoded = URL(string: encoded)
            let task = URLSession.shared.dataTask(with: urlencoded!) {(data, response, error) in
                guard let data = data else {
                    print("data is nil")
                    return
                }
                print(String(data: data, encoding: .utf8)!)
                guard let kanjiResult = try? JSONDecoder().decode(KanjiResults.self, from: data) else {
                    print("couldnt decode JSON")
                    return
                }
                onCompletion(kanjiResult)
            }
            task.resume()
        }
    }
}

struct KanjiResults: Codable {
    let kanji:String
    let grade:Int
    let stroke_count:Int
    let meanings:[String]
    let kun_readings:[String]
    let on_readings:[String]
    let name_readings:[String]
    let jlpt:Int
    let unicode:String
    let heisig_en:String
    /*
    init() {
        kanji = ""
        grade = 0
        stroke_count = 0
        meanings = [""]
        kun_readings = [""]
        on_readings = [""]
        name_readings = [""]
        jlpt=0
        unicode="Default"
        heisig_en=""
    }
     */
}

/*
 {  "kanji":"校",
    "grade":1,
    "stroke_count":10,
    "meanings":["exam","school","printing","proof","correction"],
    "kun_readings":[],
    "on_readings":["コウ","キョウ"],
    "name_readings":["めん"],
    "jlpt":4,
    "unicode":"6821",
    "heisig_en":"exam"}
 
 */
