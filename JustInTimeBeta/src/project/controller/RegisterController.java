package project.controller;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;
import org.slim3.controller.validator.Validators;
import org.slim3.util.BeanUtil;
import org.slim3.util.RequestMap;

import project.dto.UsersDto;
import project.service.UsersService;

import java.util.Map;


public class RegisterController extends Controller{
    
    private UsersService service = new UsersService();
    
    @Override
    protected Navigation run() throws Exception {
        Validators v = new Validators(this.request);
        v.add("fullName", v.required());
        v.add("email", v.required());
        v.add("password", v.required(), v.minlength(8), v.maxlength(24));
        
        if(v.validate()){
            this.requestScope("errors", "");
            Map<String,Object> input = new RequestMap(this.request);
            UsersDto usersDto = new UsersDto();
            BeanUtil.copy(input, usersDto);
            service.addUser(usersDto);
            return redirect(this.basePath);
            
        }
        else{
            return redirect("/registration");
        }
        

    }

}
