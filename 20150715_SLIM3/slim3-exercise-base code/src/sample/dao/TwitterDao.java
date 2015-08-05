package sample.dao;

import java.util.List;

import org.slim3.datastore.Datastore;
import sample.meta.TweetMeta;
import sample.model.Tweet;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Transaction;

/**
* Dao used to access the datastore for tweet transactions.s
* @author Peter Clark Guisadio
* @version 0.01
* Version History
* [05/07/2015] 0.01 – Peter Clark Guisadio – Initial codes.
*/
public class TwitterDao {

    /**
     * Method used to save a tweet.
     * @param tweetModel - tweet to be saved.
     * @return Boolean - true, if tweet is saved; otherwise, false.
     */
    public boolean saveTweet(Tweet tweetModel) {
        boolean result = true;
        try {
            Transaction tx = Datastore.beginTransaction();
            //Manually allocate key
            Key key = Datastore.allocateId(KeyFactory.createKey("Account", "Default"), "Tweet");
            tweetModel.setKey(key);
            tweetModel.setId(key.getId());
            Datastore.put(tweetModel);
            tx.commit();
        } catch (Exception e) {
            result = false;
        }
        return result;
    }

    /**
     * Method used to retrieve list of tweets.
     * @return List<Tweet> - list of tweets.
     */
    public List<Tweet> getAllTweets() {
        TweetMeta t = new TweetMeta();
        Key parentKey = KeyFactory.createKey("Account", "Default");
        return Datastore.query(t ,parentKey).asList();
    }

    /**
     * Method used to update a tweet.
     * @param tweetModel - tweet to save.
     * @return Boolean - true, if tweet is saved; otherwise, false.
     */
    public boolean updateTweet(Tweet tweetModel) {
        boolean result = true;
        //TODO: Instantiate a TweetMeta object
        TweetMeta tweetMeta = new TweetMeta();
        //TODO: using the base code below, create a filter for retrieving the original tweet model using the id property.
        //Query.Filter filter = new Query.FilterPredicate("", FilterOperator., "");
        Query.Filter filter = new Query.FilterPredicate("id", FilterOperator.EQUAL, tweetModel.getId());

        try {
            //TODO: use Datastore.query() method to get the original tweet model.
            Tweet tweet = Datastore.query(tweetMeta).filter(filter).asSingle();
            
            if (tweet != null) {
                
                tweet.setCreatedDate(tweetModel.getCreatedDate());
                tweet.setContent(tweetModel.getContent());
                
                Transaction tx = Datastore.beginTransaction();
                Datastore.put(tweet);
                tx.commit();
            }
            else {
                result = false;
            }
            //TODO: IF result of query is not null
            //TODO:     set content of original model with the new createdDate.
            //TODO:     set content of original model with the new content.
            //TODO:     begin a transaction. hint: use the Datastore static method.
            //TODO:     put the originalTweetModel to update the content.
            //TODO:     commit the transaction.
            //TODO: ELSE
            //TODO:     set result to false.
        } catch (Exception e) {
            result = false;
        }
        return result;
    }

    //TODO: Create dao method for deleting a tweet. (optional)
    public boolean deleteTweet(Tweet tweetModel) {
        boolean result = true;
        
        TweetMeta tweetMeta = new TweetMeta();
        Query.Filter filter = new Query.FilterPredicate("id", FilterOperator.EQUAL, tweetModel.getId());

        try {
            Tweet tweet = Datastore.query(tweetMeta).filter(filter).asSingle();
            if (tweet != null) {
                Transaction tx = Datastore.beginTransaction();
                Datastore.delete(tweet.getKey());
                tx.commit();
            }
            else {
                result = false;
            }
        } catch (Exception e) {
            result = false;
        }
        return result;
    }
}
