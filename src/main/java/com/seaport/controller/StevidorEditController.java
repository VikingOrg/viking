package com.seaport.controller;

import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.seaport.command.StevidorEditCommand;
import com.seaport.domain.Contact;
import com.seaport.domain.Stevidor;
import com.seaport.domain.User;
import com.seaport.service.IPortService;
import com.seaport.service.IPositionService;
import com.seaport.service.IStevidorService;
import com.seaport.utils.VikingConstant;

/**
 * The Controller class that invoke business logic and create a MachineModel&View object. 
 *
 * @Author       Danil Ozherelyev
 * @version      1.0 12/12/13 <P>
 */

@Controller
@RequestMapping("/stevidorEdit")
@SessionAttributes("stevidorEditCommand")
public class StevidorEditController {
	@Autowired
	private IStevidorService stevidorService;
	@Autowired
	private IPortService portService;
	@Autowired
	private IPositionService positionService;
	
	/**
	 * Setting up search page for Stevidors 
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(method = RequestMethod.GET)
	public String setUpForm(HttpServletRequest request, 
							ModelMap model) throws Exception {
		String stevidorId = request.getParameter("stevidorId");
		StevidorEditCommand stevidorEditCommand = new StevidorEditCommand();
		if (stevidorId != null) {
			stevidorEditCommand.setStevidor(stevidorService.getStevidor(Integer.parseInt(stevidorId)));
			if (request.getParameter("copy")!= null) {
				stevidorEditCommand.setFormType("C");
				stevidorEditCommand.getStevidor().setStevidorId(null);
			} else {
				stevidorEditCommand.setFormType("E");
			}
		}
		
		stevidorEditCommand.setUserPort(portService.getPortsMap());
		stevidorEditCommand.setPositionList(positionService.getPositions());
		if (stevidorEditCommand.getStevidor().getContacts().size() < 10) {
			for (int i = stevidorEditCommand.getStevidor().getContacts().size(); i < 11; i++) {
				stevidorEditCommand.getStevidor().getContacts().add(new Contact());
			}
		}
		model.put("stevidorEditCommand", stevidorEditCommand);
		return "stevidorEdit";
	}
	
	@RequestMapping(value="/getStevidor/{stevidorId}", method = RequestMethod.GET)
	@ResponseBody
	public Stevidor getStevidor(@PathVariable String stevidorId, ModelMap model) throws Exception {
		Stevidor stevidor = stevidorService.getStevidor(Integer.parseInt(stevidorId));
		return stevidor;
	}	
	
	/**
	 * Saving changes for stevidor update.
	 * @param request
	 * @param model
	 * @param stevidorEditCommand
	 * @param result
	 * @param redirectAttributes
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(method = RequestMethod.POST) 
	public String onSubmit(HttpServletRequest request, Model model, 
								@Valid @ModelAttribute("stevidorEditCommand") StevidorEditCommand stevidorEditCommand,
								BindingResult result, RedirectAttributes redirectAttributes) throws Exception {

		if (result.hasErrors()) {
			model.addAttribute("error", "message.user.error.generic");
			return "stevidorEdit";
		}
		
		/*Setting up default not null values.*/
		Timestamp updateDate = new Timestamp(new Date().getTime());
		User user = (User)request.getSession().getAttribute(VikingConstant.USER_MODEL);
		if (stevidorEditCommand.getStevidor().getStevidorId()== null) {
			stevidorEditCommand.getStevidor().setCreateUserId(user.getUserId());
			stevidorEditCommand.getStevidor().setCreateDate(updateDate);
		}
		stevidorEditCommand.getStevidor().setUpdateUserId(user.getUserId());
		stevidorEditCommand.getStevidor().setUpdateDate(updateDate);
		
		stevidorService.saveStevidor(stevidorEditCommand.getStevidor());
		redirectAttributes.addFlashAttribute("message", "message.user.success.generic");
		
		return "redirect:stevidorSearch";
	}
}
