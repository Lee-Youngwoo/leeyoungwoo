package egovframework.reply.service.Controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import egovframework.reply.service.ReplyService;
import egovframework.reply.service.ReplyVO;


@Controller
@SessionAttributes("reply")
public class ReplyController {

	@Resource(name="ReplyService")
	private ReplyService replyService;
	
	
	 @RequestMapping(value="insertReply.do",method=RequestMethod.GET) 
	 public String insertReplyView(ReplyVO vo) throws Exception{
		  replyService.insertReply(vo); 
		  return "selectCompl"; 
	  }
	 
	
	@RequestMapping(value="insertReply.do",method=RequestMethod.POST)
	public String insertReply(ReplyVO vo) throws Exception{
		replyService.insertReply(vo);
		return "forward:selectCompl.do";
	}
	
	@RequestMapping(value="updateReply.do")
	public String updateReply(ReplyVO vo) throws Exception{
		replyService.updateReply(vo);
		return "forward:ComplList.do";
	}
	
	@RequestMapping(value="deleteReply.do")
	public String deleteReply(ReplyVO vo) throws Exception{
		replyService.deleteReply(vo);
		return "forward:ComplList.do";
	}
	@RequestMapping(value="up.do")
	public String up(@RequestParam int cno) throws Exception {
		replyService.up(cno);
		return "forward:ComplList.do"; 	//페이지값을 그대로 넘겨받기 위해서 포워딩을 사용해 컨트롤러로 리턴시킨다.
	}
	
	@RequestMapping(value="down.do")
	public String down(@RequestParam int cno) throws Exception{
		replyService.down(cno);
		return "forward:ComplList.do";
	}
	 
	

}
