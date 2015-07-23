/* ------------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) Rococo Global Technologies, Inc - All Rights Reserved 2015
 * --------------------------------------------------------------------------- */

package sample.controller.twitter;

import java.util.List;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

import sample.model.Tweet;
import sample.service.TwitterService;

/**
 * INSTRUCTIONS:
 * 1. Follow the steps found in the TODO: comments.
 * 2. Clue - all the necessary imports have been added already.
 * 3. Make sure you have followed the UI instructions in war/twitter/index.jsp
 * 4. REQUIRED goal: to be able to UPDATE a tweet from the Datastore.
 * 5. BONUS goal: Implement deleting tweets by following the TODO: comments tagged as (optional).
 */

/**
 * Initial Controller.
 * @author Peter Clark Guisadio
 * @version 0.01
 * Version History
 * [05/07/2015] 0.01 – Peter Clark Guisadio  – Initial codes.
 */
public class IndexController extends Controller {

    /**
     * The TwitterService to use.
     * Holds the method for retrieving list of tweets.
     */
    TwitterService service = new TwitterService();

    @Override
    public Navigation run() throws Exception {
        List<Tweet> tweetList = service.getTweetList();
        requestScope("tweetList", tweetList);
        return forward("index.jsp");
    }
}
