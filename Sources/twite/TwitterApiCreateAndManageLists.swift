//
//  File.swift
//  
//
//  Created by netaka on 2021/09/20.
//  
//

import Foundation
import OAuthSwift

extension TwitterApi {
    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-list
    public func getListsList(success: @escaping (Data) -> Void) -> Void {
        oauth1.client.get(TWITTER_API + "lists/list.json") { result in
            switch result {
            case .success(let response):
                let data = response.data
                success(data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-members
    public func getListsMembers(_ listId: String, success: @escaping (Data) -> Void) -> Void {
        oauth1.client.get(TWITTER_API + "lists/members.json?list_id=\(listId)") { result in
            switch result {
            case .success(let response):
                let data = response.data
                success(data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-members-show
    public func getListsMembersShow(_ listId: String, screenName: String, success: @escaping (Data) -> Void, failure: @escaping (OAuthSwiftError) -> Void) -> Void {
        oauth1.client.get(TWITTER_API + "lists/members/show.json?list_id=\(listId)&screen_name=\(screenName)") { result in
            switch result {
            case .success(let response):
                let data = response.data
                success(data)
            case .failure(let error):
                print(error)
                failure(error)
            }
        }
    }
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-memberships
    public func getListsMembership(_ screenName: String, success: @escaping (Data) -> Void) -> Void {
        oauth1.client.get(TWITTER_API + "lists/members/memberships.json?screen_name=\(screenName)") { result in
            switch result {
            case .success(let response):
                let data = response.data
                success(data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-ownerships
    public func getListsOwnership(_ screenName: String, success: @escaping (Data) -> Void) -> Void {
        oauth1.client.get(TWITTER_API + "lists/members/ownerships.json?screen_name=\(screenName)") { result in
            switch result {
            case .success(let response):
                let data = response.data
                success(data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-show
    public func getListsShow(_ listId: String, success: @escaping (Data) -> Void) -> Void {
        oauth1.client.get(TWITTER_API + "lists/show.json?list_id=\(listId)") { result in
            switch result {
            case .success(let response):
                let data = response.data
                success(data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-statuses
    public func getListsStatuses(_ listId: String, count: Int=200, success: @escaping (Data) -> Void) -> Void {
        oauth1.client.get(TWITTER_API + "lists/statuses.json?list_id=\(listId)&count=\(count)&tweet_mode=extended") { result in
            switch result {
            case .success(let response):
                let data = response.data
                success(data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-subscribers
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-subscribers-show
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-subscriptions
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-create
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-destroy
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-members-create
    public func postListsMembersCreate(_ listId: String, screenName: String) {
        oauth1.client.post(TWITTER_API + "favorites/members/create.json?list_id=\(listId)&screen_name=\(screenName)") { result in
            switch result {
            case .success(let response):
                print(response.string!)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-members-create_all
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-members-destroy
    public func postListsMembersDestroy(_ listId: String, screenName: String) {
        oauth1.client.post(TWITTER_API + "favorites/members/destroy.json?list_id=\(listId)&screen_name=\(screenName)") { result in
            switch result {
            case .success(let response):
                print(response.string!)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-members-destroy_all
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-subscribers-create
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-subscribers-destroy
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-update
}
