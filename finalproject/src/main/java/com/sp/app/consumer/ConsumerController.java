package com.sp.app.consumer;

import java.io.FileOutputStream;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.common.MyUtil;
import com.sp.app.member.SessionInfo;

@Controller("consumer.consumerController")
@RequestMapping("/consumer/**")
public class ConsumerController {

	@Autowired
	private ConsumerService service;
	@Autowired
	private MyUtil myUtil;

//	고객센터 메인
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String mainForm(@RequestParam(value = "questionType", defaultValue = "1") String questionType,
			HttpServletRequest req, Model model) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("questionType", questionType);
		map.put("offset", 0);
		map.put("rows", 10);

		List<ConsumerFAQ> list = service.populList(map);

		model.addAttribute("list", list);
		return ".consumer.main";
	}

//	FAQ 등록
	@RequestMapping(value = "faq/created", method = RequestMethod.GET)
	public String faqCreatedForm() throws Exception {

		return "consumer/faq/created";
	}

	@RequestMapping(value = "faq/created", method = RequestMethod.POST)
	public String faqCreatedSubmit(ConsumerFAQ dto, HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			dto.setUserId(info.getUserId());
			service.insertFAQ(dto);
		} catch (Exception e) {

		}

		return "redirect:/consumer/list";
	}

//	1:1 문의
	@RequestMapping(value = "qna/created", method = RequestMethod.GET)
	public String ceratedForm(Model model) throws Exception {

		return "consumer/qna/created";
	}

	@RequestMapping(value = "qna/created", method = RequestMethod.POST)
	public String createdSubmit(ConsumerQNA dto, HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo)session.getAttribute("member");

		try {
			dto.setUserId(info.getUserId());
			service.insertQna(dto);
		} catch (Exception e) {
		}

		return "redirect:/consumer/myHistory";
	}

//	내문의내역
	@RequestMapping(value = "myHistory", method = RequestMethod.GET)
	public String myHistoryForm(HttpSession session, Model model, @RequestParam(value = "page", defaultValue = "1") int current_page, HttpServletRequest req) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		List<ConsumerQNA> list = null;
		String userId = info.getUserId();
		int offset = 0;
		int rows = 10;
		int dataCount = 0;
		int total_page = 0;
		
		dataCount = service.myHistoryDataCount(userId);
		
		if (dataCount != 0) {
			total_page = myUtil.pageCount(rows, dataCount);
		}
		
		if (total_page < current_page) {
			current_page = total_page;
		}
		
		offset = (current_page - 1) * rows;
		if (offset < 0) {
			offset = 0;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("offset", offset);
		map.put("rows", rows);

		list = service.listQNA(map);
		
		String cp = req.getContextPath();
		String listUrl = cp + "/consumer/myHistory";

		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

		return ".consumer.myHistory";
	}

//	자주하는 질문 리스트
	@RequestMapping(value = "list")
	public String listForm(@RequestParam(defaultValue = "1") String questionType,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "") String keyword, HttpServletRequest req, Model model) throws Exception {
		int offset = 0;
		int rows = 10;
		int dataCount = 0;
		int total_page = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}

		Map<String, Object> map = new HashMap<>();
		map.put("questionType", questionType);
		map.put("keyword", keyword);

		dataCount = service.dataCount(map);

		if (dataCount != 0) {
			total_page = myUtil.pageCount(rows, dataCount);
		}

		if (total_page < current_page) {
			current_page = total_page;
		}

		offset = (current_page - 1) * rows;
		if (offset < 0) {
			offset = 0;
		}

		map.put("offset", offset);
		map.put("rows", rows);

		List<ConsumerFAQ> list = service.fqaList(map);

		int listNum, n = 0;
		for (ConsumerFAQ dto : list) {
			listNum = dataCount - (offset + n);
			dto.setListNum(listNum);
			n++;
		}

		String cp = req.getContextPath();
		String listUrl = cp + "/consumer/list";

		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("keyword", keyword);
		model.addAttribute("questionType", questionType);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

		return ".consumer.list";
	}

	@RequestMapping(value = "updateReview")
	@ResponseBody
	public void updateReview(@RequestParam int num) throws Exception {
		service.updateReview(num);
	}

	@RequestMapping(value = "readQNA")
	@ResponseBody
	public Map<String, Object> readQNA(@RequestParam int num) throws Exception {
		ConsumerQNA dto = null;
		dto = service.readQNA(num);

		Map<String, Object> model = new HashMap<String, Object>();

		model.put("dto", dto);

		return model;
	}

	@RequestMapping(value = "answerReview")
	public String answerReview(@RequestParam int qnaNum, @RequestParam int score, @RequestParam String content)
			throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("qnaNum", qnaNum);
		map.put("score", score);
		map.put("content", content);

		service.answerReviewSubmit(map);

		return "redirect:/consumer/myHistory";
	}

	@RequestMapping(value = "readPopul")
	@ResponseBody
	public Map<String, Object> readPopul(@RequestParam int faqNum) throws Exception {

		ConsumerFAQ dto = null;
		dto = service.populRead(faqNum);

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("dto", dto);

		return model;
	}

//	어드민 문의처리페이지
	@RequestMapping(value = "listAdmin")
	public String listAdminForm(@RequestParam(defaultValue = "0") int questionType,
			@RequestParam(value = "page", defaultValue = "1") int current_page, HttpServletRequest req, Model model)
			throws Exception {
		int offset = 0;
		int rows = 10;
		int dataCount = 0;
		int total_page = 0;

		Map<String, Object> map = new HashMap<>();
		map.put("questionType", questionType);

		dataCount = service.adminQNACount(questionType);

		if (dataCount != 0) {
			total_page = myUtil.pageCount(rows, dataCount);
		}

		if (total_page < current_page) {
			current_page = total_page;
		}

		offset = (current_page - 1) * rows;
		if (offset < 0) {
			offset = 0;
		}

		map.put("offset", offset);
		map.put("rows", rows);

		List<ConsumerQNA> list = service.listAdminLoad(map);

		String cp = req.getContextPath();
		String listUrl = cp + "/consumer/listAdmin";

		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("questionType", questionType);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

		return ".consumer.listAdmin";
	}
	
	@RequestMapping(value = "listAdminSubmit")
	public String listAdminSubmit(@RequestParam String content, @RequestParam String subject, @RequestParam int qnaNum) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("qnaNum", qnaNum);
		map.put("subject", subject);
		map.put("content", content);
		
		service.qnaAnswer(map);
		
		return "redirect:/consumer/listAdmin";
	}

	@RequestMapping(value = "sellerSubject")
	public String sellerSubjectForm(HttpSession session, Model model) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String userId = info.getUserId();
		SellerInfo dto = service.infoLoad(userId);

		model.addAttribute("dto", dto);

		return ".consumer.sellerSubject";
	}

	@ResponseBody
	@RequestMapping(value = {"ImgSaveTest"}, method = RequestMethod.POST)
	public ModelMap ImgSaveTest(@RequestParam HashMap<Object, Object> param, final HttpServletRequest request,
			final HttpServletResponse response, HttpSession session) throws Exception {
		ModelMap map = new ModelMap();
		SellerInfo dto = new SellerInfo();
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String userId = info.getUserId();
		
		dto.setUserId(userId);
		dto.setUserName(request.getParameter("userName"));
		dto.setTel(request.getParameter("tel"));
		dto.setAddr(request.getParameter("addr"));
		dto.setBankName(request.getParameter("bankName"));
		dto.setBankOwner(request.getParameter("bankOwner"));
		dto.setBankNumber(request.getParameter("bankNumber"));
		

		String binaryData = request.getParameter("imgSrc");
		FileOutputStream stream = null;
		try {
			System.out.println("binary file   " + binaryData);
			if (binaryData == null || binaryData.trim().equals("")) {
				throw new Exception();
			}
			binaryData = binaryData.replaceAll("data:image/png;base64,", "");
			byte[] file = Base64.decodeBase64(binaryData);
			String fileName = UUID.randomUUID().toString();

			stream = new FileOutputStream("D:/test2/" + fileName + ".png");
			stream.write(file);
			stream.close();
			System.out.println("캡처 저장");
			
			dto.setFileName(fileName);
			
			service.sellerFirst(dto);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("에러 발생");
		} finally {
			if (stream != null) {
				stream.close();
			}
		}

		return map;
	}
}
