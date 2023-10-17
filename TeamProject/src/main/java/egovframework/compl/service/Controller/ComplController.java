package egovframework.compl.service.Controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import egovframework.compl.service.ComplDefaultVO;
import egovframework.compl.service.ComplService;
import egovframework.compl.service.ComplVO;
import egovframework.reply.service.ReplyService;
import egovframework.reply.service.ReplyVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@SessionAttributes("compl")
public class ComplController {

	@Resource(name="ComplService")
	private ComplService complService;
	
	@Resource(name="ReplyService")
	private ReplyService replyService;
	
	@RequestMapping(value="insertCompl.do",method=RequestMethod.GET)
	public String insertComplView(ComplVO vo) throws Exception{
		return "insertCompl";
	}
	
	@RequestMapping(value="insertCompl.do",method=RequestMethod.POST)
	public String insertCompl(ComplVO vo) throws Exception{
		//for(int i=0;i<100;i++) {
			
			complService.insertCompl(vo);
		//}	
			return "forward:ComplList.do";
	}
	
	@RequestMapping(value="updateCompl.do",method=RequestMethod.GET)
	public String updateComplView(@ModelAttribute("compl")ComplVO vo,Model model) throws Exception{
		model.addAttribute("compl", complService.selectCompl(vo));
		return "updateCompl";
	}

	@RequestMapping(value="updateCompl.do",method=RequestMethod.POST)
	public String updateCompl(@ModelAttribute("compl")ComplVO vo) throws Exception{
		complService.updateCompl(vo);
		return "forward:ComplList.do";
	}
	
	@RequestMapping(value="deleteCompl.do")
	public String deleteCompl(ComplVO vo) throws Exception{
		complService.deleteCompl(vo);
		return "forward:ComplList.do";
	}
	
	@RequestMapping(value="selectCompl.do")
	public String selectCompl(ReplyVO rvo,ComplVO vo,Model model) throws Exception{
		complService.viewCount(vo.getCno());
		model.addAttribute("compl", complService.selectCompl(vo));
		model.addAttribute("reply", replyService.selectReply(rvo));
		return "selectCompl";
	}
	
	@RequestMapping(value="ComplList.do")
	public String selectComplList(Model model,@RequestParam(value="searchCondition",required = false)String searchCondition,@RequestParam(value="searchKeyword",required = false)String searchKeyword,@ModelAttribute("searchVO") ComplDefaultVO searchVO,ReplyVO rvo) throws Exception{
		  
		  if(searchVO.getSearchCondition()==null) searchVO.setSearchCondition("Ctitle");
		  if(searchVO.getSearchKeyword()==null) searchVO.setSearchKeyword("");
		
		  PaginationInfo paginationInfo = new PaginationInfo();
		  paginationInfo.setCurrentPageNo(searchVO.getViewPage()); //현재 페이지 번호
		  paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());  //한 페이지에 게시되는 게시물 건수
		  paginationInfo.setPageSize(searchVO.getPageSize());  //페이징 리스트의 사이즈
		  
		  searchVO.setStartIndex(paginationInfo.getFirstRecordIndex());
		  searchVO.setEndIndex(paginationInfo.getLastRecordIndex());
		  searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		  
		  int total = complService.selectComplTotal(searchVO);
		  paginationInfo.setTotalRecordCount(total);
		  
		  System.out.println("total="+total);
		  
		  model.addAttribute("paginationInfo", paginationInfo);
		  model.addAttribute("searchCondition",searchCondition);
		  model.addAttribute("searchKeyword", searchKeyword);
		  model.addAttribute("complList",complService.selectComplList(searchVO));
		  model.addAttribute("replyList", replyService.selectReplyList(rvo));
		  
		  
		  return "ComplList";
	}
	
	
	@ModelAttribute("conditionMap")
	public Map<String,String> searchConditionMap(){
		Map<String,String> conditionMap = new HashMap<>();
		conditionMap.put("제목", "Ctitle");
		conditionMap.put("내용", "CContent");
		return conditionMap;
	}
	@RequestMapping(value="MyCompl.do")
	public String selectMyComplList(@RequestParam(value="id",required=false)String id,ReplyVO rvo,ComplVO vo,Model model,@ModelAttribute("searchVO") ComplDefaultVO searchVO)throws Exception{
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getViewPage()); //현재 페이지 번호
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());  //한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(searchVO.getPageSize());  //페이징 리스트의 사이즈
		  
		searchVO.setStartIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setEndIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		int total = complService.selectMyComplTotal(searchVO);
		paginationInfo.setTotalRecordCount(total);
		System.out.println(total);
		
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("id",id);
		model.addAttribute("complList", complService.selectMyComplList(searchVO));
		model.addAttribute("creplyList",replyService.selectReplyList(rvo));
		return "MyCompl";
	}
}
