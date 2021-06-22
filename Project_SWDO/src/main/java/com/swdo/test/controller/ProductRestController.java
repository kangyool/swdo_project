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
	
//  getSimilarProductsFile와 productSelectAll_imageSearch를 분리하고 싶은데, RestController에서의 컨트롤러 간 데이터 전달이 현재 불가능하다. 선생님께 자문 요망
	
//	@RequestMapping(value = "/productListForm_imageSearch_rest", method = RequestMethod.GET)
//	public HashMap<String, Object> productListForm_imageSearch_rest(HttpServletRequest request, 
//			@RequestParam(name = "currentPage", defaultValue = "1") int currentPage) {
//		
//		HashMap<String, Object> map = new HashMap<>();
//		ArrayList<String> similarProduct = new ArrayList<String>();
//		
//		//ImageSearch로부터 전달된 데이터를 받는다.
//        Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
//        
//        if(flashMap!=null) {
//            
//           similarProduct =(ArrayList<String>)flashMap.get("similarProduct");
//        }
//		
//		logger.info("ArrayList<String> similarProduct : {}", similarProduct);
//		
//		int totalRecordsCount = service.productTotalRecordsCount_imageSearch(similarProduct);
//		
//		PageNavigator navi = new PageNavigator(currentPage, totalRecordsCount, COUNT_PER_PAGE);
//		
//		navi.setCurrentPage(navi.getCurrentPage() + 1); 
//		
//		ArrayList<ProductVO> result = service.productSelectAll_imageSearch(similarProduct, navi.getStartRecord(), COUNT_PER_PAGE);
//		
//		System.out.println(result);
//		
//		map.put("productList", result);
//		map.put("navi", navi);
//		
//		return map;
//	}
	

}
