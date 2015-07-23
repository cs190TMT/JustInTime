package sample.controller.twitter;

import java.util.Map;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;
import org.slim3.util.BeanUtil;
import org.slim3.util.RequestMap;

import sample.dto.TwitterDto;
import sample.service.TwitterService;

public class DeleteController extends Controller {

    private TwitterService service = new TwitterService();
    
    @Override
    protected Navigation run() throws Exception {
        Map<String,Object> input = new RequestMap(this.request);
        TwitterDto tweetDto = new TwitterDto();
        BeanUtil.copy(input, tweetDto);
        service.deleteTweet(tweetDto);
        return redirect(this.basePath);
    }

}
