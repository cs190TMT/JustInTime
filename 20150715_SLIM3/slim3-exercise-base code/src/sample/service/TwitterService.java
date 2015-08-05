/* ------------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) Rococo Global Technologies, Inc - All Rights Reserved 2015
 * --------------------------------------------------------------------------- */
package sample.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import sample.dao.TwitterDao;
import sample.dto.TwitterDto;
import sample.model.Tweet;

/**
 * Service used to handle tweet transactions.
 * @author Peter Guisadio
 * @version 0.01
 * Version History
 * [05/07/2015] 0.01 – Peter Clark Guisadio – Initial codes.
 */
public class TwitterService {

    /**
     * The TwitterService to use.
     * Holds the method for transacting with the datastore.
     */
    TwitterDao dao = new TwitterDao();

    /**
     * Method used to add a tweet.
     * @param input - tweet to add.
     * @return TwitterDto - if transaction was unsuccessful, contains list of errors.
     */
    public TwitterDto tweet(TwitterDto input) {
        Tweet tweet = new Tweet();
        tweet.setCreatedDate(input.getCreatedDate());
        tweet.setContent(input.getContent());

        if(!this.dao.saveTweet(tweet)) {
            input.setErrorList(new ArrayList<String>());
            input.getErrorList().add("database error!");
        }

        return input;
    }

    /**
     * Method used to retrieve list of tweets.
     * @return List<Tweet> - list of tweets.
     */
    public List<Tweet> getTweetList() {
        return this.dao.getAllTweets();
    }

    /**
     * Method used to update a tweet.
     * @param input - tweet to update.
     * @return TwitterDto - if transaction was unsuccessful, contains list of errors.
     */
    public TwitterDto updateTweet(TwitterDto input) {
        //TODO: Instantiate a new Tweet object and set its id and content using the values from the TwitterDto object. Set the createdDate to the current date.
        //TODO: Call dao layer method for updating a tweet, pass Tweet object as parameter.
        Tweet tweet = new Tweet();
        tweet.setId(input.getId());
        tweet.setCreatedDate(new Date().toString());
        tweet.setContent(input.getContent());
        
        if(!this.dao.updateTweet(tweet)) {
            input.setErrorList(new ArrayList<String>());
            input.getErrorList().add("database error!");
        }
        
        return input;
    }

    //TODO: Create service method for deleting a tweet. (optional)
    public TwitterDto deleteTweet(TwitterDto input) {
        Tweet tweet = new Tweet();
        tweet.setId(input.getId());
        
        if(!this.dao.deleteTweet(tweet)) {
            input.setErrorList(new ArrayList<String>());
            input.getErrorList().add("database error!");
        }
        
        return input;
    }
}
