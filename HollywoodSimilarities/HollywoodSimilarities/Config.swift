//
//  Config.swift
//  HollywoodSimilarities
//
//  Created by Andrew McKinley on 2/15/16.
//  Copyright © 2016 Andrew McKinley. All rights reserved.
//

import Foundation

struct Config {
    struct ServiceConstants{
        static let apiKey = "45b53fed0a34751a8fda0043801d6e08"
        static let baseUrl = "https://api.themoviedb.org/3"
    }
    
    struct MainVCConstants {
        static let firstPlaceholderText = "Type First movie here"
        static let secondPlaceholderText = "Type Second movie here"
        static let buttonTitle = "Compare!!"
        
        static let confusedTitle = "Got a bit confused"
        static let confusedDetail = "Which one did you mean?"
        
        static let tooManyTitle = "Found too many"
        static let tooManyDetail = "Please narrow your search"
        
        static let insufficentMoviesTitle = "Please select two different movies"
        
        static let titleBarText = "Test"
    }
    
    struct CellIdentifiers {
        static let cellID = "CELL_ID"
    }


}