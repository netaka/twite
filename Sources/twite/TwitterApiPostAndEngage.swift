//
//  TwitterApiPostAndEngage.swift
//  
//
//  Created by netaka on 2021/09/18.
//  
//

import Foundation
import OAuthSwift

extension TwitterApi {
    //https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/post-statuses-update
    public func postStatusesUpdate(_ status: String) {
        let parameters: OAuthSwift.Parameters = [
            "status": status
        ]
        oauth1.client.post(TWITTER_API + "statuses/update.json", parameters: parameters) { result in
            switch result {
            case .success(let response):
                print(response.string!)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/post-statuses-destroy-id
    public func postStatusesDestroy(_ idStr: String) {
        oauth1.client.post(TWITTER_API + "statuses/destroy/\(idStr).json") { result in
            switch result {
            case .success(let response):
                print(response.string!)
            case .failure(let error):
                print(error)
            }
        }
    }
 
    //https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/get-statuses-show-id
    public func getStatusesShow(_ idStr: String, success: @escaping (Data) -> Void) {
        oauth1.client.get(TWITTER_API + "statuses/show.json?id=\(idStr)&tweet_mode=extended") { result in
            switch result {
            case .success(let response):
                let data = response.data
                success(data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/get-statuses-lookup
    public func getStatusesLookup(_ idStrs: [String], success: @escaping (Data) -> Void) {
        oauth1.client.get(TWITTER_API + "statuses/lookup.json?id=\(idStrs.joined(separator: ","))") { result in
            switch result {
            case .success(let response):
                let data = response.data
                success(data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/post-statuses-retweet-id
    public func postStatusesRetweet(_ idStr: String) {
        oauth1.client.post(TWITTER_API + "statuses/retweet/\(idStr).json") { result in
            switch result {
            case .success(let response):
                print(response.string!)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/post-statuses-unretweet-id
    public func postStatusesUnretweet(_ idStr: String) {
        oauth1.client.post(TWITTER_API + "statuses/unretweet/\(idStr).json") { result in
            switch result {
            case .success(let response):
                print(response.string!)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/get-statuses-retweets-id
    public func getStatusesRetweets(_ idStr: String, success: @escaping (Data) -> Void) {
        oauth1.client.get(TWITTER_API + "statuses/retweets.json?id=\(idStr)") { result in
            switch result {
            case .success(let response):
                let data = response.data
                success(data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/get-statuses-retweets_of_me
    public func getStatusesRetweetsOfMe(success: @escaping (Data) -> Void) {
        oauth1.client.get(TWITTER_API + "statuses/retweets_of_me.json") { result in
            switch result {
            case .success(let response):
                let data = response.data
                success(data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/get-statuses-retweeters-ids
    public func getStatusesRetweetersIds(_ idStr: String, success: @escaping (Data) -> Void) {
        oauth1.client.get(TWITTER_API + "statuses/statuses/retweeters/ids.json?id=\(idStr)") { result in
            switch result {
            case .success(let response):
                let data = response.data
                success(data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/post-favorites-create
    public func postFavoritesCreate(_ idStr: String) {
        oauth1.client.post(TWITTER_API + "favorites/create.json?id=\(idStr)") { result in
            switch result {
            case .success(let response):
                print(response.string!)
            case .failure(let error):
                print(error)
            }
        }
    }

    //https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/post-favorites-destroy
    public func postFavoritesDestroy(_ idStr: String) {
        oauth1.client.post(TWITTER_API + "favorites/destroy.json?id=\(idStr)") { result in
            switch result {
            case .success(let response):
                print(response.string!)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/get-favorites-list
    public func getFavoritesList(success: @escaping (Data) -> Void) {
        oauth1.client.get(TWITTER_API + "statuses/statuses/favorites/list.json") { result in
            switch result {
            case .success(let response):
                let data = response.data
                success(data)
            case .failure(let error):
                print(error)
            }
        }
    }
}
