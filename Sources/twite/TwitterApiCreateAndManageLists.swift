//
//  TwitterApiCreateAndManageLists.swift
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
    public func getListsMembers(_ listId: String, count: Int=5000, success: @escaping (Data) -> Void) -> Void {
        oauth1.client.get(TWITTER_API + "lists/members.json?list_id=\(listId)&count=\(count)") { result in
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
    public func getListsSubscribers(_ listId: String, count: Int=5000, success: @escaping (Data) -> Void) -> Void {
        oauth1.client.get(TWITTER_API + "lists/subscribers.json?list_id=\(listId)") { result in
            switch result {
            case .success(let response):
                let data = response.data
                success(data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-subscribers-show
    public func getListsSubscribersShow(_ listId: String, screenName: String, success: @escaping (Data) -> Void, failure: @escaping (OAuthSwiftError) -> Void) -> Void {
        oauth1.client.get(TWITTER_API + "lists/subscribers/show.json?list_id=\(listId)&screen_name=\(screenName)") { result in
            switch result {
            case .success(let response):
                let data = response.data
                success(data)
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-subscriptions
    public func getListsSubscriptions(_ screenName: String, success: @escaping (Data) -> Void) -> Void {
        oauth1.client.get(TWITTER_API + "lists/subscriptions.json?screen_name=\(screenName)") { result in
            switch result {
            case .success(let response):
                let data = response.data
                success(data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-create
    public func postListsCreate(_ name: String) {
        oauth1.client.post(TWITTER_API + "lists/create.json?name=\(name)") { result in
            switch result {
            case .success(let response):
                print(response.string!)
            case .failure(let error):
                print(error)
            }
        }
    }

    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-destroy
    public func postListsDestroy(_ listId: String) {
        oauth1.client.post(TWITTER_API + "lists/destroy.json?list_id=\(listId)") { result in
            switch result {
            case .success(let response):
                print(response.string!)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-members-create
    public func postListsMembersCreate(_ listId: String, screenName: String) {
        oauth1.client.post(TWITTER_API + "lists/members/create.json?list_id=\(listId)&screen_name=\(screenName)") { result in
            switch result {
            case .success(let response):
                print(response.string!)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-members-create_all
    public func postListsMembersCreateAll(_ listId: String, screenNames: [String]) {
        oauth1.client.post(TWITTER_API + "lists/members/create_all.json?list_id=\(listId)&screen_name=\(screenNames.joined(separator: ","))") { result in
            switch result {
            case .success(let response):
                print(response.string!)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-members-destroy
    public func postListsMembersDestroy(_ listId: String, screenName: String) {
        oauth1.client.post(TWITTER_API + "lists/members/destroy.json?list_id=\(listId)&screen_name=\(screenName)") { result in
            switch result {
            case .success(let response):
                print(response.string!)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-members-destroy_all
    public func postListsMembersDestroyAll(_ listId: String, screenNames: [String]) {
        oauth1.client.post(TWITTER_API + "lists/members/destroy_all.json?list_id=\(listId)&screen_name=\(screenNames.joined(separator: ","))") { result in
            switch result {
            case .success(let response):
                print(response.string!)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-subscribers-create
    public func postListsSubscribersCreate(_ listId: String) {
        oauth1.client.post(TWITTER_API + "lists/subscribers/create.json?list_id=\(listId)") { result in
            switch result {
            case .success(let response):
                print(response.string!)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-subscribers-destroy
    public func postListsSubscribersDestroy(_ listId: String) {
        oauth1.client.post(TWITTER_API + "lists/subscribers/destroy.json?list_id=\(listId)") { result in
            switch result {
            case .success(let response):
                print(response.string!)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-update
    public func postListsUpdate(_ listId: String, mode: String) {
        oauth1.client.post(TWITTER_API + "lists/update.json?list_id=\(listId)&mode=\(mode)") { result in
            switch result {
            case .success(let response):
                print(response.string!)
            case .failure(let error):
                print(error)
            }
        }
    }
}
