/* ------------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) Rococo Global Technologies, Inc - All Rights Reserved 2015
 * --------------------------------------------------------------------------- */
package project.controller;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;
import org.slim3.controller.validator.Validators;
import org.slim3.util.BeanUtil;
import org.slim3.util.RequestMap;

/**
 * Main Screen Home controller.
 * @author <name here>
 *
 */
public class IndexController extends Controller {

    @Override
    protected Navigation run() throws Exception {
        Validators v = new Validators(this.request);
        v.add("user", v.required());
        /*
        if(v.validate()){
            return forward("project/index.jsp");
        }
        else{
            return redirect("/login");
        }*/
        
        return forward("project/index.jsp");
    }
}
