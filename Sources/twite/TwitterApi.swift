//
//  TwitterController.swift
//  Hibari
//
//  Created by netaka on 2021/08/25.
//  Copyright © 2021 netaka.net. All rights reserved.
//

import Foundation
import OAuthSwift

class TwitterApi {
    var oauth1: OAuth1Swift
    let TWITTER_API = "https://api.twitter.com/1.1/"
    
    init() {
        oauth1 = OAuth1Swift(consumerKey: TweetAccount.consumerKey, consumerSecret: TweetAccount.consumerSecret)
        oauth1.client.credential.oauthToken = TweetAccount.oauthToken
        oauth1.client.credential.oauthTokenSecret = TweetAccount.oauthTokenSecret
    }
    
    func postUpdate(_ status: String) {
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
    func postRetweet(_ idStr: String) {
        oauth1.client.post(TWITTER_API + "statuses/retweet/\(idStr).json") { result in
            switch result {
            case .success(let response):
                print(response.string!)
            case .failure(let error):
                print(error)
            }
        }
    }
    func getUserTimeline(_ screenName: String, count: Int = 200, success: @escaping (Data) -> Void) {
        oauth1.client.get(TWITTER_API + "statuses/user_timeline.json?screen_name=\(screenName)&count=\(count)&tweet_mode=extended") { result in
            switch result {
            case .success(let response):
                let data = response.data
                success(data)
            case .failure(let error):
                print(error)
            }
        }
    }
    func getHomeTimeline(count: Int = 200, success: @escaping (Data) -> Void) {
        oauth1.client.get(TWITTER_API + "statuses/home_timeline.json?count=\(count)") { result in
            switch result {
            case .success(let response):
                let data = response.data
                success(data)
            case .failure(let error):
                print(error)
            }
        }
    }
    func getFriendsList(count: Int = 200, success: @escaping (Data) -> Void) -> Void {
        oauth1.client.get(TWITTER_API + "friends/list.json?count=\(count)") { result in
            switch result {
            case .success(let response):
                let data = response.data
                success(data)
            case .failure(let error):
                print(error)
            }
        }
    }
    func getFollowersList(count: Int = 200, success: @escaping (Data) -> Void) -> Void {
        oauth1.client.get(TWITTER_API + "followers/list.json?count=\(count)") { result in
            switch result {
            case .success(let response):
                let data = response.data
                success(data)
            case .failure(let error):
                print(error)
            }
        }
    }
    func getUserProfile(_ screenName: String, success: @escaping (Data) -> Void) -> Void {
        oauth1.client.get(TWITTER_API + "users/show.json?screen_name=\(screenName)") { result in
            switch result {
            case .success(let response):
                let data = response.data
                success(data)
            case .failure(let error):
                print(error)
            }
        }
    }
    func getListsStatuses(_ list_id: String, count: Int=200, success: @escaping (Data) -> Void) -> Void {
        oauth1.client.get(TWITTER_API + "lists/statuses.json?list_id=\(list_id)&count=\(count)&tweet_mode=extended") { result in
            switch result {
            case .success(let response):
                let data = response.data
                success(data)
            case .failure(let error):
                print(error)
            }
        }
    }
    func getListsShow(_ list_id: String, success: @escaping (Data) -> Void) -> Void {
        oauth1.client.get(TWITTER_API + "lists/show.json?list_id=\(list_id)") { result in
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
