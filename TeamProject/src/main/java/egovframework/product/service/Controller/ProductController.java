package egovframework.product.service.Controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.imageio.ImageIO;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import egovframework.product.service.AttachImageDefaultVO;
import egovframework.product.service.AttachImageService;
import egovframework.product.service.AttachImageVO;
import egovframework.product.service.ProductDefaultVO;
import egovframework.product.service.ProductService;
import egovframework.product.service.ProductVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import net.coobird.thumbnailator.Thumbnails;

@Controller
@SessionAttributes("product")
public class ProductController {
	@Resource(name="productService")
	private ProductService productService;
	@Resource(name="ImageService")
	private AttachImageService ImageService;
	
	
	//이미지 정보반환
		@RequestMapping(value="/getAttachList1.do",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		public ModelAndView getAttachList(int nno){//ResponseEntity<List<AttachImageVO>>
			System.out.println("이미지정보반환하라구...");
			System.out.println("이미지 ㅇㅇ "+ImageService.getAttachList(nno));
			ResponseEntity<List<AttachImageVO>>result=new ResponseEntity<List<AttachImageVO>>(ImageService.getAttachList(nno), HttpStatus.OK);
			
			ModelAndView mv=new ModelAndView();
			mv.addObject("obj", result);
			mv.setViewName("jsonView");
			System.out.println(mv);
			return mv;
		}
		//이미지 불러오기
		@RequestMapping(value = "/display1.do", method = RequestMethod.GET)
		@ResponseBody
		public ResponseEntity<byte[]> getImage(@RequestParam String fileName) {
			File file = new File("C:\\img\\" + fileName);
			System.out.println(file);
			ResponseEntity<byte[]> result = null;

			try {
				HttpHeaders header = new HttpHeaders();
				header.add("Content-type", Files.probeContentType(file.toPath()));
				result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
				System.out.println(result);
				System.out.println(result.getHeaders());
				System.out.println(result.getBody());
				System.out.println(result.getStatusCode());
				System.out.println(fileName);
			} catch (IOException e) {
				e.printStackTrace();
			}
			System.out.println("Result"+result);
			return result;
		}

		/* 첨부 파일 업로드 */
		@RequestMapping(value = "/uploadAjaxAction1.do", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		//@ResponseBody
		public ModelAndView uploadAjaxAction(//ResponseEntity<List<AttachImageVO>>
				@RequestParam("uploadFile") MultipartFile[] uploadFile,Model model) {
			/* 이미지 파일 체크 */

			String uploadFolder = "C:\\img";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			String str = sdf.format(date);
			String datePath = str.replace("-", File.separator);
			/* 폴더 생성 */
			File uploadPath = new File(uploadFolder, datePath);
			if (uploadPath.exists() == false) {
				uploadPath.mkdirs();
			}

			List<AttachImageVO> list = new ArrayList<>();

			// 향상된 for
			for (MultipartFile multipartFile : uploadFile) {
				AttachImageVO vo = new AttachImageVO();
				/* 파일 이름 */
				String uploadFileName = multipartFile.getOriginalFilename();
				vo.setFileName(uploadFileName);
				vo.setUploadPath(datePath);

				/* uuid 적용 파일 이름 */
				String uuid = UUID.randomUUID().toString();
				vo.setUuid(uuid);

				uploadFileName = uuid + "_" + uploadFileName;

				/* 파일 위치, 파일 이름을 합친 File 객체 */
				File saveFile = new File(uploadPath, uploadFileName);

				/* 파일 저장 */
				try {
					multipartFile.transferTo(saveFile);

					/* 방법 2 */
					File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);

					BufferedImage bo_image = ImageIO.read(saveFile);
//					BufferedImage bt_image = new BufferedImage(300, 500, BufferedImage.TYPE_3BYTE_BGR);
					// 비율
					double ratio = 3;
					// 넓이 높이
					int width = (int) (bo_image.getWidth() / ratio);
					int height = (int) (bo_image.getHeight() / ratio);

					Thumbnails.of(saveFile).size(width, height).toFile(thumbnailFile);
				} catch (Exception e) {
					e.printStackTrace();
				}
				list.add(vo);
			}
			ResponseEntity<List<AttachImageVO>> result = new ResponseEntity<List<AttachImageVO>>(list, HttpStatus.OK);
			ModelAndView mv=new ModelAndView();
			mv.addObject("obj", result);
			mv.setViewName("jsonView");
			System.out.println(mv);
			return mv;
		}
		
		
		/* 이미지 파일 삭제 */
		@RequestMapping("/deleteFile1.do")
		public ResponseEntity<String> deleteFile(String fileName){
			File file=null;
			System.out.println("FileName"+fileName);
			try {
				/* 썸네일 파일 삭제 */
				file = new File("c:\\img\\" + URLDecoder.decode(fileName, "UTF-8"));
				
				file.delete();
				
				/* 원본 파일 삭제 */
				String originFileName = file.getAbsolutePath().replace("s_", "");
				System.out.println("OriginalFileName: "+originFileName);
				
				file = new File(originFileName);
				
				file.delete();
				
				
			} catch(Exception e) {
				
				e.printStackTrace();
				
				return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
				
			}
			return new ResponseEntity<String>("success",HttpStatus.OK);
		}
	
	@RequestMapping(value="/insertProduct.do",method=RequestMethod.GET)
	public String insertProductView(ProductVO vo) throws Exception{
		System.out.println("등록 화면이동");
		return "insertProduct";
	}
	@RequestMapping(value="/insertProduct.do",method=RequestMethod.POST)
	public String insertProduct(ProductVO vo) throws Exception{
		System.out.println("등록 중");
		productService.insertProduct(vo);
		return "forward:ProductList.do";
	}
	
	@RequestMapping("selectProduct.do")
	public String selectProduct(ProductVO vo, Model model) throws Exception {
		System.out.println("특정 글 조회");
		model.addAttribute("product",productService.selectProduct(vo));
		return "selectProduct";
	}
	@RequestMapping("ProductList.do")
	public String ListProduct(ProductVO vo ,AttachImageVO avo,@ModelAttribute("searchVO") ProductDefaultVO searchVO,Model model,@ModelAttribute("searchVO2") AttachImageDefaultVO searchVO2) throws Exception{
		
		PaginationInfo paginationInfo = new PaginationInfo();//상품 페이징
		PaginationInfo paginationInfo2 = new PaginationInfo();//이미지 페이징
		
		paginationInfo.setCurrentPageNo(searchVO.getViewPage()); //현재 페이지 번호
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());  //한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(searchVO.getPageSize());  //페이징 리스트의 사이즈
		  
		paginationInfo2.setCurrentPageNo(searchVO.getViewPage()); 
		paginationInfo2.setRecordCountPerPage(searchVO.getPageUnit()); 
		paginationInfo2.setPageSize(searchVO.getPageSize());  
		  
		searchVO.setStartIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setEndIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		  
		searchVO2.setStartIndex(paginationInfo2.getFirstRecordIndex());
		searchVO2.setEndIndex(paginationInfo2.getLastRecordIndex());
		searchVO2.setRecordCountPerPage(paginationInfo2.getRecordCountPerPage());
		
		int total=productService.selectProductTotal(searchVO);
		paginationInfo.setTotalRecordCount(total);
		
		int total2 = ImageService.selectImageTotal(searchVO2);
		paginationInfo2.setTotalRecordCount(total2);
		
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("paginationInfo2", paginationInfo2);
		
		model.addAttribute("productList",productService.selectProductList(searchVO));
		model.addAttribute("imageList",ImageService.getImageList(searchVO2));
		return "ProductList";
	}
	@RequestMapping(value="updateProduct.do",method=RequestMethod.GET)
	public String updateProductView(ProductVO vo)throws Exception{
		System.out.println("상품 수정화면");
		return "updateProduct";
	}
	@RequestMapping(value="updateProduct.do",method=RequestMethod.POST)
	public String updateProduct(ProductVO vo)throws Exception{
		System.out.println("상품업데이트");
		productService.updateProduct(vo);
		return "forward:ProductList.do";
	}
	
	@RequestMapping("deleteProduct.do")
	public String deleteProduct(ProductVO vo)throws Exception{
		System.out.println("삭제");
		productService.deleteProduct(vo);
		return "forward:ProductList.do";
	}

	
	@RequestMapping(value="plike.do")
	public String up(@RequestParam int pno) throws Exception {
		productService.up(pno);
		return "forward:ProductList.do";
	}

}
