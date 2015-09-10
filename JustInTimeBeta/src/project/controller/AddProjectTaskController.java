package project.controller;

import java.util.Date;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

import project.dto.TasksDto;
import project.service.TasksService;

public class AddProjectTaskController extends Controller {

    TasksService service = new TasksService();
    
    @Override
    protected Navigation run() throws Exception {
        TasksDto taskDto = new TasksDto();
        taskDto.setTaskName(this.request.getParameter("taskName"));
        taskDto.setTaskDetails(this.request.getParameter("taskDetails"));
        taskDto.setDateCreated(new Date().toString());
        taskDto.setTimeAlloted(Float.valueOf(this.request.getParameter("timeAlloted")));
        taskDto.setTaskPhase(this.request.getParameter("taskPhase"));
        service.addProjectTask(taskDto, this.request.getParameter("projectName"));
        return redirect(this.basePath);
    }

}
