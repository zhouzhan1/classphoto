package cn.zhou.utils;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.omg.CORBA.Request;
import org.springframework.http.HttpRequest;

import cn.zhou.entity.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class LoginIterceptor extends MethodFilterInterceptor {

	@Override
	protected String doIntercept(ActionInvocation actionInvocation) throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		User user =  (User) request.getSession().getAttribute("user");
		if(user != null)
		{
			return actionInvocation.invoke();
		}else
		{
			request.setAttribute("meg","请先登录");
			return "loginNo";
		}
	}

}
