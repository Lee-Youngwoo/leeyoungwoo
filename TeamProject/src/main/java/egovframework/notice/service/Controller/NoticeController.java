package egovframework.notice.service.Controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import egovframework.menu.service.AttachImageService2;
import egovframework.menu.service.AttachImageVO2;
import egovframework.menu.service.MenuService;
import egovframework.menu.service.MenuVO;
import egovframework.notice.service.NoticeDefaultVO;
import egovframework.notice.service.NoticeService;
import egovframework.notice.service.NoticeVO;
import egovframework.product.service.AttachImageService;
import egovframework.product.service.AttachImageVO;
import egovframework.product.service.ProductService;
import egovframework.product.service.ProductVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@SessionAttributes("notice")
public class NoticeController {

	@Resource(name="NoticeService")
	private NoticeService noticeService;
	@Resource(name="productService")
	private ProductService productService;
	@Resource(name="ImageService2")
	private AttachImageService2 menuImageService;
	@Resource(name="ImageService")
	private AttachImageService productImageService;
	@Resource(name="menuService")
	private MenuService menuService;

	@RequestMapping(value="insertNotice.do",method=RequestMethod.GET)
	public String insertNoticeView(NoticeVO vo) throws Exception{
		return "insertNotice";
	}

	@RequestMapping(value="insertNotice.do",method = RequestMethod.POST)
	public String insertNotice(NoticeVO vo) throws Exception{
		 // 파일 업로드 처리
        String filename = null;
        MultipartFile uploadfile = vo.getUploadfile();
        if (!uploadfile.isEmpty()) {
            String originalFileName = uploadfile.getOriginalFilename();
            String ext = FilenameUtils.getExtension(originalFileName); // 확장자 구하기
            UUID uuid = UUID.randomUUID(); // UUID 구하기
            filename = uuid + "." + ext;
            uploadfile.transferTo(new File("c:\\upload\\" + filename));
        }
        vo.setFilename(filename);

        System.out.println(vo.getFilename());
//		for(int i=0;i<5;i++) {
//			noticeService.insertNotice(vo);
//		}
        noticeService.insertNotice(vo);
			return "forward:NoticeList.do";
	}

	@RequestMapping(value="updateNotice.do")
	public String updateNotice(@ModelAttribute("notice") NoticeVO vo) throws Exception{

        // 파일 업로드
        String filename = null;
        MultipartFile uploadfile = vo.getUploadfile();
        if (!uploadfile.isEmpty()) {
            String originalFileName = uploadfile.getOriginalFilename();
            String ext = FilenameUtils.getExtension(originalFileName); // 확장자구하기
            UUID uuid = UUID.randomUUID(); // uuid구하기
            filename = uuid + "." + ext;
            uploadfile.transferTo(new File("c:\\upload\\" + filename));
            vo.setFilename(filename);
        }else{
            noticeService.updateNotice(vo);
            return "forward:NoticeList.do";
        }
        noticeService.updateNotice(vo);
        return "forward:NoticeList.do";
	}

	@RequestMapping(value="deleteNotice.do")
	public String deleteNotice(NoticeVO vo) throws Exception{
		noticeService.deleteNotice(vo);
		return "forward:NoticeList.do";
	}

	@RequestMapping(value="selectNotice.do")
	public String selectNotice(NoticeVO vo,Model model) throws Exception{
		noticeService.viewCount(vo.getNno());
		model.addAttribute("notice", noticeService.selectNotice(vo));
		return "selectNotice";
	}

	@RequestMapping(value="NoticeList.do")
	public String selectNoticeList(Model model,@RequestParam(value="searchCondition",required = false)String searchCondition,@RequestParam(value="searchKeyword",required = false)String searchKeyword,@ModelAttribute("searchVO") NoticeDefaultVO searchVO) throws Exception{
		  if(searchVO.getSearchCondition()==null) searchVO.setSearchCondition("ntitle");
		  if(searchVO.getSearchKeyword()==null) searchVO.setSearchKeyword("");

		  PaginationInfo paginationInfo = new PaginationInfo();
		  paginationInfo.setCurrentPageNo(searchVO.getViewPage()); //현재 페이지 번호
		  paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());  //한 페이지에 게시되는 게시물 건수
		  paginationInfo.setPageSize(searchVO.getPageSize());  //페이징 리스트의 사이즈

		  searchVO.setStartIndex(paginationInfo.getFirstRecordIndex());
		  searchVO.setEndIndex(paginationInfo.getLastRecordIndex());
		  searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		  int total = noticeService.selectNoticeTotal(searchVO);
		  paginationInfo.setTotalRecordCount(total);

		  System.out.println("total="+total);

		  model.addAttribute("paginationInfo", paginationInfo);
		  model.addAttribute("searchCondition",searchCondition);
		  model.addAttribute("searchKeyword", searchKeyword);
		  model.addAttribute("noticeList",noticeService.selectNoticeList(searchVO));

		  return "NoticeList";
	}

	@RequestMapping(value="main.do")
	public String MainPage(NoticeVO nvo,ProductVO pvo,MenuVO mvo,AttachImageVO2 mvoi,AttachImageVO pvoi,Model model) throws Exception{
		model.addAttribute("MainNotice",noticeService.MainNoticeList(nvo));
		model.addAttribute("MainProduct",productService.MainProductList(pvo));
		model.addAttribute("MainProductI",productImageService.MainProduct(pvoi));
		model.addAttribute("MainMenuI",menuImageService.MainMenu(mvoi));
		model.addAttribute("MainMenu",menuService.MainMenu(mvo));
		return "main";
	}


	@ModelAttribute("conditionMap")
	public Map<String,String> searchConditionMap(){
		Map<String,String> conditionMap = new HashMap<>();
		conditionMap.put("제목", "ntitle");
		conditionMap.put("내용", "ncontent");
		return conditionMap;
	}
}
