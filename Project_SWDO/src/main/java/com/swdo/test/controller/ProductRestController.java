package com.swdo.test.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.google.cloud.vision.v1.Product;
import com.google.cloud.vision.v1.ProductName;
import com.google.cloud.vision.v1.ProductSearchClient;
import com.google.cloud.vision.v1.ReferenceImage;
import com.swdo.test.api.ProductSearchAPI;
import com.swdo.test.service.ProductService;
import com.swdo.test.util.PageNavigator;
import com.swdo.test.vo.ProductVO;

@RestController
@RequestMapping(value = "/product")
public class ProductRestController {
	
	@Autowired
	private ProductService service;
	
	private static final int COUNT_PER_PAGE = 3;
	
	private static final Logger logger = LoggerFactory.getLogger(ProductRestController.class);
	
	
	@RequestMapping(value = "/enroll", method = RequestMethod.POST)
	public int enroll(ProductVO product) throws IOException {
		 
		ProductSearchAPI.createProduct(product);
			
		int cnt = service.productInsert(product);
		
		return cnt;
	}
	
	@RequestMapping(value="/productListForm_rest" , method = RequestMethod.GET)
	public HashMap<String, Object> productlistForm_rest(@RequestParam(name = "searchText", defaultValue = "")String searchText, 
			@RequestParam(name = "currentPage", defaultValue = "1") int currentPage) {
		
		HashMap<String, Object> map = new HashMap<>();
		
		int totalRecordsCount = service.productTotalRecordsCount(searchText);
		
		PageNavigator navi = new PageNavigator(currentPage, totalRecordsCount, COUNT_PER_PAGE);

		navi.setCurrentPage(navi.getCurrentPage() + 1); 
		
		ArrayList<ProductVO> result = service.productSelectAll(searchText, navi.getStartRecord(), COUNT_PER_PAGE);
		
		map.put("productList", result);
		map.put("navi", navi);
		map.put("searchText", searchText);
		
		return map;
	}
	
	@RequestMapping(value = "/imageSearch_rest", method = RequestMethod.GET)
	public HashMap<String, Object> imageSearch_rest(String userImage, @RequestParam(name = "currentPage", defaultValue = "1") int currentPage) 
			throws IOException {
		
		logger.info("userImage : {}", userImage);
		
		HashMap<String, Object> map = new HashMap<>();
		
		ArrayList<String> similarProduct =  ProductSearchAPI.getSimilarProductsFile("snappy-guard-316800", "us-west1", "productSetId-001", "apparel-v2", userImage, "");
		
		System.out.println(similarProduct);
		
		int totalRecordsCount = service.productTotalRecordsCount_imageSearch(similarProduct);
		
		PageNavigator navi = new PageNavigator(currentPage, totalRecordsCount, COUNT_PER_PAGE);
		
		navi.setCurrentPage(navi.getCurrentPage() + 1); 
		
		ArrayList<ProductVO> result = service.productSelectAll_imageSearch(similarProduct, navi.getStartRecord(), COUNT_PER_PAGE);
		
		System.out.println(result);
		
		map.put("productList", result);
		map.put("navi", navi);
		
		return map;
		
	}
	
	@RequestMapping(value = "/likeProduct_click", method = RequestMethod.POST)
	public HashMap<String, Object> likeProduct_click(String productId){
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("productId", productId);
		
		service.likeInsert(map);
		
		logger.info("productId : {}", productId);
		
		int like_check_new = service.likeUpdate(map);
		map.put("like_check_new", like_check_new);
		
		int like_sum = service.likeSum();
		map.put("like_sum", like_sum);
		
		return map;
	}
	
	@RequestMapping(value = "/likeProduct_mouseover", method = RequestMethod.POST)
	public HashMap<String, Object> likeProduct_mouseover(String productId){
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("productId", productId);
		
		logger.info("productId : {}", productId);
		
		int like_check_cur = service.likeSelect(map);
		
		map.put("like_check_cur", like_check_cur);
		
		return map;
	}
	
	@RequestMapping(value = "/likeSum", method = RequestMethod.GET)
	public HashMap<String, Object> likeSum(){
		
		HashMap<String, Object> map = new HashMap<>();
		int like_sum = service.likeSum();
		
		map.put("like_sum", like_sum);
		
		return map;
	}
	
	@RequestMapping(value= "/likeProduct_rest", method = RequestMethod.GET)
	public HashMap<String, Object> likeProductListForm() {
		
		HashMap<String, Object> map = new HashMap<>();
		
		ArrayList<String> result1 = service.likeProductSelect();
		
		logger.info("result1 : {}", result1 );
		
		ArrayList<ProductVO> result2 = service.productSelectAll_imageSearch(result1);
		
		map.put("productList", result2);
		
		logger.info("result2 : {}", result2 );
		
		return map;
	}
	

	

}
