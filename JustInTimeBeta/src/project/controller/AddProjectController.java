package project.controller;

import java.util.Map;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;
import org.slim3.util.BeanUtil;
import org.slim3.util.RequestMap;

import project.dto.ProjectsDto;
import project.service.ProjectsService;

public class AddProjectController extends Controller {

    private ProjectsService service = new ProjectsService();
    
    @Override
    protected Navigation run() throws Exception {
        Map<String, Object> input = new RequestMap(this.request);
        ProjectsDto projectDto = new ProjectsDto();
        BeanUtil.copy(input, projectDto);
        service.addProject(projectDto);
        return redirect(this.basePath);
    }
}
