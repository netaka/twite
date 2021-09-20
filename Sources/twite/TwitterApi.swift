//
//  TwitterController.swift
//  Hibari
//
//  Created by netaka on 2021/08/25.
//  Copyright © 2021 netaka.net. All rights reserved.
//

import Foundation
import OAuthSwift

public class TwitterApi {
    let oauth1: OAuth1Swift
    let TWITTER_API = "https://api.twitter.com/1.1/"
    
    public init(oauth1: OAuth1Swift) {
        self.oauth1 = oauth1
    }
    
    public func getUserTimeline(_ screenName: String, count: Int = 200, success: @escaping (Data) -> Void) {
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
    public func getHomeTimeline(count: Int = 200, success: @escaping (Data) -> Void) {
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
    public func getFriendsList(count: Int = 200, success: @escaping (Data) -> Void) -> Void {
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
    public func getFollowersList(count: Int = 200, success: @escaping (Data) -> Void) -> Void {
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
    public func getUserProfile(_ screenName: String, success: @escaping (Data) -> Void) -> Void {
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
}
