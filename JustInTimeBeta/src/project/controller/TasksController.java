/* -------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) JustInTime
 * -------------------------------------------------------------------------
 */

package project.controller;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

public class TasksController extends Controller {

    @Override
    protected Navigation run() throws Exception {
        return forward("project/tasks.jsp");
    }

}