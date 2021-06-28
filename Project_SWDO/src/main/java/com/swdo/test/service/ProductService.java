package com.swdo.test.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.swdo.test.dao.ProductDAO;
import com.swdo.test.util.FileService;
import com.swdo.test.vo.ProductVO;
import com.swdo.test.vo.UserImageVO;
import com.swdo.test.vo.UserVO;

@Service
public class ProductService {
	
	@Autowired
	private ProductDAO dao;
	
	@Autowired
	private HttpSession session;
	
	private static final Logger logger = LoggerFactory.getLogger(ProductService.class);
	
	private static final String UPLOAD_PATH = "C:/Users/kangyool/Desktop/SWDO/SWDO ICT PROJECT/project_swdo_userPhoto"; 

	public int productInsert(ProductVO product) {
		
		logger.info("{}", product);
		
		String uri = product.getGcsUri().replace("gs://", "https://storage.cloud.google.com/");
		
		logger.info("{}", uri);
		
		product.setUri(uri);
		
		logger.info("{}", product);
		
		int cnt = dao.productInsert(product);
		
		if(cnt == 0) {
			logger.info("제품 등록 실패 : {}", product);
		}else {
			logger.info("제품 등록 성공 : {}", product);
		}
		
		return cnt;
	}
	
	public void productDelete(String productId) {
		
		int cnt = dao.productDelete(productId);
		
		if(cnt == 0) {
			System.out.println("제품 정보 삭제 실패");
		}else {
			System.out.println("제품 정보 삭제 성공");
		}
	}
	
	public int productTotalRecordsCount(String searchText) {
		
		int totalRecord = dao.productTotalRecordsCount(searchText);
		
		return totalRecord;
		
	}
	
	public ArrayList<ProductVO> productSelectAll(String searchText, int startRecord, int countPerPage){ 
		
		ArrayList<ProductVO> result = dao.productSelectAll(searchText, startRecord, countPerPage);
		
		return result;
	}
	
	public String imageInsert(MultipartFile upload) {
		
		UserImageVO userImage = new UserImageVO();
		
		int cnt = 0;
		
		if(!upload.isEmpty()) { 
			
			userImage.setSavedFileName(FileService.saveFile(upload, UPLOAD_PATH));

			userImage.setOriginalFileName(upload.getOriginalFilename());
			
			userImage.setSavedFilePath(UPLOAD_PATH + "/" + userImage.getSavedFileName());
			
			session.setAttribute("userImage", userImage.getSavedFilePath());
			
			cnt = dao.imageInsert(userImage);
			
			if(cnt == 0) {
				logger.info("사용자 참조 이미지 등록 실패 : {}", userImage);
			}else {
				logger.info("사용자 참조 이미지 등록 성공 : {}", userImage);
			}
		}
		
		return userImage.getSavedFilePath();
	}
	
	public int productTotalRecordsCount_imageSearch(ArrayList<String> similarProduct) {
		
		int totalRecord = dao.productTotalRecordsCount_imageSearch(similarProduct);
		
		return totalRecord;
		
	}
	
	public ArrayList<ProductVO> productSelectAll_imageSearch(ArrayList<String> similarProduct, int startRecord, int countPerPage){ 
		
		ArrayList<ProductVO> result = dao.productSelectAll_imageSearch( similarProduct, startRecord, countPerPage);
		
		return result;
	}
	
	public ArrayList<ProductVO> productSelectAll_imageSearch(ArrayList<String> similarProduct){ 
		
		ArrayList<ProductVO> result = dao.productSelectAll_imageSearch(similarProduct);
		
		return result;
	}
	
	public ProductVO productSelectOne(String productId) {	
		ProductVO result = dao.productSelectOne(productId);
		return result;
	}
	
	public void likeInsert(HashMap<String, Object> map) {
		
		UserVO user = (UserVO) session.getAttribute("loginVO");
		map.put("user_id", user.getUser_id());
		
		int cnt = dao.likeInsert(map);
		
		if (cnt == 1) {
			logger.info("좋아요 데이터 등록 성공 : {}", map);
		} else {
			logger.info("좋아요 데이터 등록 실패 : {}", map);
		}
	
	}
	
	public int likeUpdate(HashMap<String, Object> map) {
		
		UserVO user = (UserVO) session.getAttribute("loginVO");
		map.put("user_id", user.getUser_id());
		
		int like_check_org = dao.likeUpdate(map);
		int like_check_new = 0;
		
		if (like_check_org == 1) {
			like_check_new = 0;
		} else {
			like_check_new = 1;	
		}
		
		return like_check_new;
	
	}
	
	public int likeSelect(HashMap<String, Object> map) {
		UserVO user = (UserVO) session.getAttribute("loginVO");
		map.put("user_id", user.getUser_id());
		
		int like_check_cur = dao.likeSelect(map);
		
		return like_check_cur;
	}
	
	public int likeSum() {
		
		UserVO user = (UserVO) session.getAttribute("loginVO");
		
		int like_sum = dao.likeSum(user.getUser_id());
		
		return like_sum;
		
	}
}
