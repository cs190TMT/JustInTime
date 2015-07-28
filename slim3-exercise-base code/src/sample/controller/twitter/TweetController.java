/* ------------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) Rococo Global Technologies, Inc - All Rights Reserved 2015
 * --------------------------------------------------------------------------- */
package sample.controller.twitter;

import java.util.Map;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;
import org.slim3.util.BeanUtil;
import org.slim3.util.RequestMap;

import sample.dto.TwitterDto;
import sample.service.TwitterService;

/**
* Controller used to tweet.
* @author Peter Clark Guisadio
* @version 0.01
* Version History
* [05/07/2015] 0.01 – Peter Clark Guisadio  – Initial codes.
*/
public class TweetController extends Controller {

    /**
     * The TwitterService to use.
     * Holds the method for adding a tweet.
     */
    private TwitterService service = new TwitterService();

    @Override
    public Navigation run() throws Exception {
        Map<String,Object> input = new RequestMap(this.request);
        TwitterDto tweetDto = new TwitterDto();
        BeanUtil.copy(input, tweetDto);
        service.tweet(tweetDto);
        return redirect(this.basePath);
    }
}
