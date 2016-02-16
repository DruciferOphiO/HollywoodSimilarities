//
//  MovieRetrievalService.swift
//  HollywoodSimilarities
//
//  Created by Andrew McKinley on 2/11/16.
//  Copyright © 2016 Andrew McKinley. All rights reserved.
//

import UIKit
import AFNetworking


class MovieRetrievalService: NSObject {
    
    typealias MovieRetrievalComplete = ([Movie]) -> Void
    typealias CastRetrievalComplete = ([Actor]) -> Void
    
    class func getMovieWithName(_name:String, _completion:MovieRetrievalComplete) {
        let manager = AFHTTPRequestOperationManager()
        manager.requestSerializer = AFJSONRequestSerializer()
        manager.responseSerializer = AFJSONResponseSerializer()
        let parameters:[String:String] = ["query":_name,"api_key":Config.ServiceConstants.apiKey]
        manager.GET("\(Config.ServiceConstants.baseUrl)/search/movie", parameters: parameters, success: { (_operation, _responseObject) -> Void in
                let data = self.parseRetrievedData(nameOfData: "results", from: _responseObject)
                var movieArray:[Movie] = [Movie]()
                for movie:NSDictionary in data{
                    let dataObject:Movie = Movie.init(JSONDictionary: movie as [NSObject : AnyObject])
                    movieArray.append(dataObject)
                }
                _completion(movieArray)
            }) { (_operation, _error) -> Void in
                print(_error)
        }
    }
    
    class func getCastOfMovie(withId _id:UInt, _completion:CastRetrievalComplete){
        
        let manager = AFHTTPRequestOperationManager()
        manager.requestSerializer = AFJSONRequestSerializer()
        manager.responseSerializer = AFJSONResponseSerializer()
        let parameters:[String:String] = ["api_key":Config.ServiceConstants.apiKey]
        manager.GET("\(Config.ServiceConstants.baseUrl)/movie/\(_id)/credits", parameters: parameters, success: { (_operation, _responseObject) -> Void in
            
                let data = self.parseRetrievedData(nameOfData: "cast", from: _responseObject)
                var castArray:[Actor] = [Actor]()
                for actor:NSDictionary in data{
                    let dataObject:Actor = Actor.init(JSONDictionary: actor as [NSObject : AnyObject])
                    castArray.append(dataObject)
                }
                _completion(castArray)
            }) { (_operation, _error) -> Void in
                print(_error)
        }

    }
    
    private class func parseRetrievedData(nameOfData _name:String, from _responseObject:AnyObject)->[NSDictionary]{
        if let adDic:NSDictionary = _responseObject as? NSDictionary{
            if let retrievedData:[NSDictionary] = adDic[_name] as? [NSDictionary]{
                return retrievedData
            }
        }
        return [NSDictionary]()
    }
    
}
